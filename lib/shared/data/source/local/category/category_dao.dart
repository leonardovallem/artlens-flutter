import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../app_database.dart';

typedef ArtworkId = int;

@injectable
class CategoryDao {
  final AppDatabase _database;

  CategoryDao(this._database);

  Future<Map<ArtworkId, List<CategoryEntity>>> retrieveCategoriesForArtworks(
    List<ArtworkId> artworkIds,
  ) async {
    if (artworkIds.isEmpty) return {};

    final query = _database.select(_database.categories).join([
      innerJoin(
        _database.artworkCategories,
        _database.artworkCategories.categoryId.equalsExp(_database.categories.name),
      ),
    ])..where(_database.artworkCategories.artworkId.isIn(artworkIds));

    final rows = await query.get();
    final Map<ArtworkId, List<CategoryEntity>> result = {};

    for (final row in rows) {
      final category = row.readTable(_database.categories);
      final link = row.readTable(_database.artworkCategories);
      result.putIfAbsent(link.artworkId, () => []).add(category);
    }

    return result;
  }

  Future<void> insertArtworksCategories(
    Map<ArtworkId, List<CategoryEntity>> artworkCategories,
  ) async {
    await _database.transaction(() async {
      final uniqueCategories = <CategoryEntity>{};
      final links = <ArtworkCategoriesRelation>[];

      for (final entry in artworkCategories.entries) {
        final artworkId = entry.key;
        final categories = entry.value;

        for (final category in categories) {
          uniqueCategories.add(category);
          links.add(ArtworkCategoriesRelation(artworkId: artworkId, categoryId: category.name));
        }
      }

      if (uniqueCategories.isNotEmpty) {
        await _database.batch((batch) {
          batch.insertAll(_database.categories, uniqueCategories.toList(), mode: .insertOrIgnore);
        });
      }

      if (links.isNotEmpty) {
        await _database.batch((batch) {
          batch.insertAll(_database.artworkCategories, links, mode: .insertOrIgnore);
        });
      }
    });
  }
}
