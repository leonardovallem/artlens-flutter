// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ArtworksTable extends Artworks
    with TableInfo<$ArtworksTable, ArtworkEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtworksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateDisplayMeta = const VerificationMeta(
    'dateDisplay',
  );
  @override
  late final GeneratedColumn<String> dateDisplay = GeneratedColumn<String>(
    'date_display',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    dateDisplay,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artworks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArtworkEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('date_display')) {
      context.handle(
        _dateDisplayMeta,
        dateDisplay.isAcceptableOrUnknown(
          data['date_display']!,
          _dateDisplayMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtworkEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtworkEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      dateDisplay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_display'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $ArtworksTable createAlias(String alias) {
    return $ArtworksTable(attachedDatabase, alias);
  }
}

class ArtworkEntity extends DataClass implements Insertable<ArtworkEntity> {
  final int id;
  final String title;
  final String? description;
  final String? dateDisplay;
  final String? imageUrl;
  const ArtworkEntity({
    required this.id,
    required this.title,
    this.description,
    this.dateDisplay,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || dateDisplay != null) {
      map['date_display'] = Variable<String>(dateDisplay);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  ArtworksCompanion toCompanion(bool nullToAbsent) {
    return ArtworksCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      dateDisplay: dateDisplay == null && nullToAbsent
          ? const Value.absent()
          : Value(dateDisplay),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory ArtworkEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtworkEntity(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      dateDisplay: serializer.fromJson<String?>(json['dateDisplay']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'dateDisplay': serializer.toJson<String?>(dateDisplay),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  ArtworkEntity copyWith({
    int? id,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<String?> dateDisplay = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
  }) => ArtworkEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    dateDisplay: dateDisplay.present ? dateDisplay.value : this.dateDisplay,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  ArtworkEntity copyWithCompanion(ArtworksCompanion data) {
    return ArtworkEntity(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      dateDisplay: data.dateDisplay.present
          ? data.dateDisplay.value
          : this.dateDisplay,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkEntity(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dateDisplay: $dateDisplay, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, dateDisplay, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtworkEntity &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.dateDisplay == this.dateDisplay &&
          other.imageUrl == this.imageUrl);
}

class ArtworksCompanion extends UpdateCompanion<ArtworkEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String?> dateDisplay;
  final Value<String?> imageUrl;
  const ArtworksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.dateDisplay = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ArtworksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.dateDisplay = const Value.absent(),
    this.imageUrl = const Value.absent(),
  }) : title = Value(title);
  static Insertable<ArtworkEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? dateDisplay,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (dateDisplay != null) 'date_display': dateDisplay,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ArtworksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<String?>? dateDisplay,
    Value<String?>? imageUrl,
  }) {
    return ArtworksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateDisplay: dateDisplay ?? this.dateDisplay,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (dateDisplay.present) {
      map['date_display'] = Variable<String>(dateDisplay.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtworksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('dateDisplay: $dateDisplay, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  CategoryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryEntity(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryEntity extends DataClass implements Insertable<CategoryEntity> {
  final String name;
  const CategoryEntity({required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(name: Value(name));
  }

  factory CategoryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryEntity(name: serializer.fromJson<String>(json['name']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'name': serializer.toJson<String>(name)};
  }

  CategoryEntity copyWith({String? name}) =>
      CategoryEntity(name: name ?? this.name);
  CategoryEntity copyWithCompanion(CategoriesCompanion data) {
    return CategoryEntity(
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryEntity(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntity && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<CategoryEntity> {
  final Value<String> name;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CategoryEntity> custom({
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({Value<String>? name, Value<int>? rowid}) {
    return CategoriesCompanion(
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArtworkCategoriesTable extends ArtworkCategories
    with TableInfo<$ArtworkCategoriesTable, ArtworkCategoriesRelation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtworkCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _artworkIdMeta = const VerificationMeta(
    'artworkId',
  );
  @override
  late final GeneratedColumn<int> artworkId = GeneratedColumn<int>(
    'artwork_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES artworks (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [artworkId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artwork_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArtworkCategoriesRelation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('artwork_id')) {
      context.handle(
        _artworkIdMeta,
        artworkId.isAcceptableOrUnknown(data['artwork_id']!, _artworkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_artworkIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {artworkId, categoryId};
  @override
  ArtworkCategoriesRelation map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtworkCategoriesRelation(
      artworkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}artwork_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $ArtworkCategoriesTable createAlias(String alias) {
    return $ArtworkCategoriesTable(attachedDatabase, alias);
  }
}

class ArtworkCategoriesRelation extends DataClass
    implements Insertable<ArtworkCategoriesRelation> {
  final int artworkId;
  final String categoryId;
  const ArtworkCategoriesRelation({
    required this.artworkId,
    required this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['artwork_id'] = Variable<int>(artworkId);
    map['category_id'] = Variable<String>(categoryId);
    return map;
  }

  ArtworkCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ArtworkCategoriesCompanion(
      artworkId: Value(artworkId),
      categoryId: Value(categoryId),
    );
  }

  factory ArtworkCategoriesRelation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtworkCategoriesRelation(
      artworkId: serializer.fromJson<int>(json['artworkId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'artworkId': serializer.toJson<int>(artworkId),
      'categoryId': serializer.toJson<String>(categoryId),
    };
  }

  ArtworkCategoriesRelation copyWith({int? artworkId, String? categoryId}) =>
      ArtworkCategoriesRelation(
        artworkId: artworkId ?? this.artworkId,
        categoryId: categoryId ?? this.categoryId,
      );
  ArtworkCategoriesRelation copyWithCompanion(ArtworkCategoriesCompanion data) {
    return ArtworkCategoriesRelation(
      artworkId: data.artworkId.present ? data.artworkId.value : this.artworkId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkCategoriesRelation(')
          ..write('artworkId: $artworkId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(artworkId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtworkCategoriesRelation &&
          other.artworkId == this.artworkId &&
          other.categoryId == this.categoryId);
}

class ArtworkCategoriesCompanion
    extends UpdateCompanion<ArtworkCategoriesRelation> {
  final Value<int> artworkId;
  final Value<String> categoryId;
  final Value<int> rowid;
  const ArtworkCategoriesCompanion({
    this.artworkId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtworkCategoriesCompanion.insert({
    required int artworkId,
    required String categoryId,
    this.rowid = const Value.absent(),
  }) : artworkId = Value(artworkId),
       categoryId = Value(categoryId);
  static Insertable<ArtworkCategoriesRelation> custom({
    Expression<int>? artworkId,
    Expression<String>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (artworkId != null) 'artwork_id': artworkId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtworkCategoriesCompanion copyWith({
    Value<int>? artworkId,
    Value<String>? categoryId,
    Value<int>? rowid,
  }) {
    return ArtworkCategoriesCompanion(
      artworkId: artworkId ?? this.artworkId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (artworkId.present) {
      map['artwork_id'] = Variable<int>(artworkId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkCategoriesCompanion(')
          ..write('artworkId: $artworkId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArtworksTable artworks = $ArtworksTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ArtworkCategoriesTable artworkCategories =
      $ArtworkCategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    artworks,
    categories,
    artworkCategories,
  ];
}

typedef $$ArtworksTableCreateCompanionBuilder =
    ArtworksCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> description,
      Value<String?> dateDisplay,
      Value<String?> imageUrl,
    });
typedef $$ArtworksTableUpdateCompanionBuilder =
    ArtworksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> description,
      Value<String?> dateDisplay,
      Value<String?> imageUrl,
    });

final class $$ArtworksTableReferences
    extends BaseReferences<_$AppDatabase, $ArtworksTable, ArtworkEntity> {
  $$ArtworksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ArtworkCategoriesTable,
    List<ArtworkCategoriesRelation>
  >
  _artworkCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.artworkCategories,
        aliasName: $_aliasNameGenerator(
          db.artworks.id,
          db.artworkCategories.artworkId,
        ),
      );

  $$ArtworkCategoriesTableProcessedTableManager get artworkCategoriesRefs {
    final manager = $$ArtworkCategoriesTableTableManager(
      $_db,
      $_db.artworkCategories,
    ).filter((f) => f.artworkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _artworkCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ArtworksTableFilterComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateDisplay => $composableBuilder(
    column: $table.dateDisplay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> artworkCategoriesRefs(
    Expression<bool> Function($$ArtworkCategoriesTableFilterComposer f) f,
  ) {
    final $$ArtworkCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artworkCategories,
      getReferencedColumn: (t) => t.artworkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.artworkCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArtworksTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateDisplay => $composableBuilder(
    column: $table.dateDisplay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArtworksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtworksTable> {
  $$ArtworksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dateDisplay => $composableBuilder(
    column: $table.dateDisplay,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  Expression<T> artworkCategoriesRefs<T extends Object>(
    Expression<T> Function($$ArtworkCategoriesTableAnnotationComposer a) f,
  ) {
    final $$ArtworkCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.artworkCategories,
          getReferencedColumn: (t) => t.artworkId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ArtworkCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.artworkCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ArtworksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtworksTable,
          ArtworkEntity,
          $$ArtworksTableFilterComposer,
          $$ArtworksTableOrderingComposer,
          $$ArtworksTableAnnotationComposer,
          $$ArtworksTableCreateCompanionBuilder,
          $$ArtworksTableUpdateCompanionBuilder,
          (ArtworkEntity, $$ArtworksTableReferences),
          ArtworkEntity,
          PrefetchHooks Function({bool artworkCategoriesRefs})
        > {
  $$ArtworksTableTableManager(_$AppDatabase db, $ArtworksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtworksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtworksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtworksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> dateDisplay = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => ArtworksCompanion(
                id: id,
                title: title,
                description: description,
                dateDisplay: dateDisplay,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String?> dateDisplay = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => ArtworksCompanion.insert(
                id: id,
                title: title,
                description: description,
                dateDisplay: dateDisplay,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArtworksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkCategoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (artworkCategoriesRefs) db.artworkCategories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (artworkCategoriesRefs)
                    await $_getPrefetchedData<
                      ArtworkEntity,
                      $ArtworksTable,
                      ArtworkCategoriesRelation
                    >(
                      currentTable: table,
                      referencedTable: $$ArtworksTableReferences
                          ._artworkCategoriesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ArtworksTableReferences(
                        db,
                        table,
                        p0,
                      ).artworkCategoriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.artworkId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ArtworksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtworksTable,
      ArtworkEntity,
      $$ArtworksTableFilterComposer,
      $$ArtworksTableOrderingComposer,
      $$ArtworksTableAnnotationComposer,
      $$ArtworksTableCreateCompanionBuilder,
      $$ArtworksTableUpdateCompanionBuilder,
      (ArtworkEntity, $$ArtworksTableReferences),
      ArtworkEntity,
      PrefetchHooks Function({bool artworkCategoriesRefs})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({required String name, Value<int> rowid});
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({Value<String> name, Value<int> rowid});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryEntity,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (
            CategoryEntity,
            BaseReferences<_$AppDatabase, $CategoriesTable, CategoryEntity>,
          ),
          CategoryEntity,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryEntity,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (
        CategoryEntity,
        BaseReferences<_$AppDatabase, $CategoriesTable, CategoryEntity>,
      ),
      CategoryEntity,
      PrefetchHooks Function()
    >;
typedef $$ArtworkCategoriesTableCreateCompanionBuilder =
    ArtworkCategoriesCompanion Function({
      required int artworkId,
      required String categoryId,
      Value<int> rowid,
    });
typedef $$ArtworkCategoriesTableUpdateCompanionBuilder =
    ArtworkCategoriesCompanion Function({
      Value<int> artworkId,
      Value<String> categoryId,
      Value<int> rowid,
    });

final class $$ArtworkCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ArtworkCategoriesTable,
          ArtworkCategoriesRelation
        > {
  $$ArtworkCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ArtworksTable _artworkIdTable(_$AppDatabase db) =>
      db.artworks.createAlias(
        $_aliasNameGenerator(db.artworkCategories.artworkId, db.artworks.id),
      );

  $$ArtworksTableProcessedTableManager get artworkId {
    final $_column = $_itemColumn<int>('artwork_id')!;

    final manager = $$ArtworksTableTableManager(
      $_db,
      $_db.artworks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_artworkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ArtworkCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ArtworkCategoriesTable> {
  $$ArtworkCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  $$ArtworksTableFilterComposer get artworkId {
    final $$ArtworksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableFilterComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtworkCategoriesTable> {
  $$ArtworkCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArtworksTableOrderingComposer get artworkId {
    final $$ArtworksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableOrderingComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtworkCategoriesTable> {
  $$ArtworkCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  $$ArtworksTableAnnotationComposer get artworkId {
    final $$ArtworksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.artworkId,
      referencedTable: $db.artworks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworksTableAnnotationComposer(
            $db: $db,
            $table: $db.artworks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtworkCategoriesTable,
          ArtworkCategoriesRelation,
          $$ArtworkCategoriesTableFilterComposer,
          $$ArtworkCategoriesTableOrderingComposer,
          $$ArtworkCategoriesTableAnnotationComposer,
          $$ArtworkCategoriesTableCreateCompanionBuilder,
          $$ArtworkCategoriesTableUpdateCompanionBuilder,
          (ArtworkCategoriesRelation, $$ArtworkCategoriesTableReferences),
          ArtworkCategoriesRelation,
          PrefetchHooks Function({bool artworkId})
        > {
  $$ArtworkCategoriesTableTableManager(
    _$AppDatabase db,
    $ArtworkCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtworkCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtworkCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtworkCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> artworkId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArtworkCategoriesCompanion(
                artworkId: artworkId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int artworkId,
                required String categoryId,
                Value<int> rowid = const Value.absent(),
              }) => ArtworkCategoriesCompanion.insert(
                artworkId: artworkId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArtworkCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({artworkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (artworkId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.artworkId,
                                referencedTable:
                                    $$ArtworkCategoriesTableReferences
                                        ._artworkIdTable(db),
                                referencedColumn:
                                    $$ArtworkCategoriesTableReferences
                                        ._artworkIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ArtworkCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtworkCategoriesTable,
      ArtworkCategoriesRelation,
      $$ArtworkCategoriesTableFilterComposer,
      $$ArtworkCategoriesTableOrderingComposer,
      $$ArtworkCategoriesTableAnnotationComposer,
      $$ArtworkCategoriesTableCreateCompanionBuilder,
      $$ArtworkCategoriesTableUpdateCompanionBuilder,
      (ArtworkCategoriesRelation, $$ArtworkCategoriesTableReferences),
      ArtworkCategoriesRelation,
      PrefetchHooks Function({bool artworkId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArtworksTableTableManager get artworks =>
      $$ArtworksTableTableManager(_db, _db.artworks);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ArtworkCategoriesTableTableManager get artworkCategories =>
      $$ArtworkCategoriesTableTableManager(_db, _db.artworkCategories);
}
