import 'package:artlens/shared/data/source/local/artwork/artwork_entity.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'category/category_entity.dart';

part 'app_database.g.dart';

@lazySingleton
@DriftDatabase(tables: [Artworks, Categories, ArtworkCategories])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
