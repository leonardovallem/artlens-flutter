import 'package:drift/drift.dart';

@DataClassName("CategoryEntity")
class Categories extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
