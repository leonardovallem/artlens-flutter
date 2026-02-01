import 'package:artlens/shared/data/source/local/app_database.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArtworkDao {
  final AppDatabase _database;

  ArtworkDao(this._database);

  Future<List<ArtworkEntity>> retrievePage(int offset, int limit) =>
      (_database.select(_database.artworks)..limit(limit, offset: offset)).get();

  Future<void> insertAll(List<ArtworkEntity> entities) => _database.batch((batch) {
    batch.insertAll(_database.artworks, entities, mode: .insertOrReplace);
  });
}
