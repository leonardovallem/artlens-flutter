import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/util/result.dart';

abstract interface class ArtRepository {
  Future<Result<List<Artwork>>> retrieveAll();
}