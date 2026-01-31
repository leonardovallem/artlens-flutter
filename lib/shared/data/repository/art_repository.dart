import 'package:artlens/shared/data/source/remote_art_datasource.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/util/extensions/iterable.dart';
import 'package:artlens/shared/util/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/art_repository.dart';

@Injectable(as: ArtRepository)
class ArtRepositoryImpl implements ArtRepository {
  final RemoteArtDatasource _remote;
  ArtRepositoryImpl(this._remote);

  @override
  Future<Result<List<Artwork>>> retrieveAll() => runCatchingAsync(() async {
    final response = (await _remote.retrieveAll(retrievedFields)).data;

    return response.data
        .mapNotNull((dto) => Artwork.fromDto(dto, response.config.iiifUrl))
        .toList();
  });

  static const retrievedFields = "id,title,description,image_id,thumbnail,date_display,category_titles";
}