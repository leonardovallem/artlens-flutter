import 'dart:developer';

import 'package:artlens/shared/data/source/local/app_database.dart';
import 'package:artlens/shared/data/source/local/category/category_dao.dart';
import 'package:artlens/shared/data/source/remote/remote_art_datasource.dart';
import 'package:artlens/shared/domain/model/artwork.dart';
import 'package:artlens/shared/util/extensions/iterable.dart';
import 'package:artlens/shared/util/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/art_repository.dart';
import '../mapper/artwork.dart';
import '../source/local/artwork/artwork_dao.dart';

@Injectable(as: ArtRepository)
class ArtRepositoryImpl implements ArtRepository {
  final RemoteArtDatasource _remote;
  final ArtworkDao _artworkDao;
  final CategoryDao _categoryDao;

  ArtRepositoryImpl(this._remote, this._artworkDao, this._categoryDao);

  @override
  Future<Result<List<Artwork>>> retrievePage(int page) => runCatchingAsync(
    () async => await _retrieveRemotePage(page),
  ).onSuccess(cacheArtworks).recoverCatchingAsync((err) async => _retrieveLocalPage(page));

  Future<void> cacheArtworks(List<Artwork> artworks) async {
    try {
      if (artworks.isEmpty) return;

      final artworkEntities = artworks.map((artwork) => artwork.toEntity());
      await _artworkDao.insertAll(artworkEntities.toList());

      final artworkCategories = <ArtworkId, List<CategoryEntity>>{};
      for (final artwork in artworks) {
        final categories = artwork.categories
            .map((category) => CategoryEntity(name: category))
            .toList();
        artworkCategories[artwork.id] = categories;
      }
      await _categoryDao.insertArtworksCategories(artworkCategories);
    } catch (err) {
      log("Error caching artworks: $err", error: err);
    }
  }

  Future<List<Artwork>> _retrieveRemotePage(int page) async {
    final response = (await _remote.retrievePage(retrievedFields, page, defaultPageSize)).data;

    return response.data
        .mapNotNull((dto) => dto.toDomain(response.config.iiifUrl))
        .toList();
  }

  Future<List<Artwork>> _retrieveLocalPage(int page) async {
    final offset = (page - 1) * defaultPageSize;
    final artworks = await _artworkDao.retrievePage(offset, defaultPageSize);
    if (artworks.isEmpty) return [];

    final ids = artworks.map((artwork) => artwork.id).toList();
    final categoryMap = await _categoryDao.retrieveCategoriesForArtworks(ids);

    return artworks.map((artwork) {
      final categories = categoryMap[artwork.id] ?? [];
      return artwork.toDomain(categories);
    }).toList();
  }

  static const retrievedFields =
      "id,title,description,image_id,thumbnail,date_display,category_titles";
  static const defaultPageSize = 20;
}
