import 'package:artlens/shared/data/source/local/app_database.dart';
import 'package:artlens/shared/data/source/local/category/category_entity.dart';
import 'package:drift/drift.dart';

@DataClassName("ArtworkEntity")
class Artworks extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get dateDisplay => text().nullable()();
  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName("ArtworkCategoriesRelation")
class ArtworkCategories extends Table {
  IntColumn get artworkId => integer().references(Artworks, #id)();
  TextColumn get categoryId => text().references(Categories, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {artworkId, categoryId};
}

typedef ArtworkWithCategories = ({ArtworkEntity artwork, List<CategoryEntity> categories});
