import 'package:artlens/shared/data/source/local/app_database.dart';
import 'package:artlens/shared/data/source/local/artwork/artwork_dao.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../util/factory/database.dart';
import '../../../../../util/fixture/artwork.dart';

void main() {
  late ArtworkDao sut;
  late AppDatabase? appDatabase;

  setUp(() {
    appDatabase = AppDatabase(createQueryExecutor());
    sut = ArtworkDao(appDatabase!);
  });

  tearDown(() async {
    await appDatabase?.close();
    appDatabase = null;
  });

  test("when retrievePage is called, then should return database contents", () async {
    await appDatabase!.batch((batch) => batch.insertAll(appDatabase!.artworks, fakeArtworkEntities()));

    final result = await sut.retrievePage(0, 10);

    final databaseContents = await appDatabase!.select(appDatabase!.artworks).get();
    expect(result, databaseContents);
  });

  test("when insertAll is called, then should insert entities into database", () async {
    final entities = fakeArtworkEntities();

    await sut.insertAll(entities);

    final databaseContents = await appDatabase!.select(appDatabase!.artworks).get();
    expect(databaseContents, entities);
  });
}