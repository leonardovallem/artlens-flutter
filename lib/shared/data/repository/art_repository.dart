import 'package:artlens/shared/data/source/remote_art_datasource.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/util/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/art_repository.dart';

@injectable
class ArtRepositoryImpl implements ArtRepository {
  final RemoteArtDatasource _remote;
  ArtRepositoryImpl(this._remote);

  @override
  Future<Result<List<Artwork>>> retrieveAll() => runCatchingAsync(() async {
    final result = await _remote.retrieveAll();
    return result.data.map(Artwork.fromDto).toList();
  });
}