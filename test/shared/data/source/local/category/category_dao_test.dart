import 'package:artlens/shared/data/source/local/app_database.dart';
import 'package:artlens/shared/data/source/local/category/category_dao.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../util/factory/database.dart';

void main() {
  late CategoryDao sut;
  late AppDatabase? appDatabase;

  setUp(() {
    appDatabase = AppDatabase(createQueryExecutor());
    sut = CategoryDao(appDatabase!);
  });

  tearDown(() async {
    await appDatabase?.close();
    appDatabase = null;
  });

  test("when retrieveCategoriesForArtworks is called, then should return artwork-category relations", () async {
    final artworkCategories = {
      1: [CategoryEntity(name: 'Landscape'), CategoryEntity(name: 'Portrait')],
      2: [CategoryEntity(name: 'Abstract')],
    };

    await sut.insertArtworksCategories(artworkCategories);

    final result = await sut.retrieveCategoriesForArtworks([1, 2, 3]);

    expect(result, {
      1: [CategoryEntity(name: 'Landscape'), CategoryEntity(name: 'Portrait')],
      2: [CategoryEntity(name: 'Abstract')],
    });
  });

  test("when insertArtworksCategories is called, then should insert categories and artwork-category relations into database", () async {
    final artworkCategories = {
      1: [CategoryEntity(name: 'Landscape'), CategoryEntity(name: 'Portrait')],
      2: [CategoryEntity(name: 'Abstract')],
    };

    await sut.insertArtworksCategories(artworkCategories);

    final categoryTableContents = await appDatabase!.select(appDatabase!.categories).get();
    final relationTableContents = await appDatabase!.select(appDatabase!.artworkCategories).get();

    expect(categoryTableContents, [
      CategoryEntity(name: 'Landscape'),
      CategoryEntity(name: 'Portrait'),
      CategoryEntity(name: 'Abstract'),
    ]);
    expect(relationTableContents, [
      ArtworkCategoriesRelation(artworkId: 1, categoryId: 'Landscape'),
      ArtworkCategoriesRelation(artworkId: 1, categoryId: 'Portrait'),
      ArtworkCategoriesRelation(artworkId: 2, categoryId: 'Abstract'),
    ]);
  });
}
