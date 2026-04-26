// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TripSearchHistoriesTable extends TripSearchHistories
    with TableInfo<$TripSearchHistoriesTable, TripSearchHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripSearchHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceCodeMeta = const VerificationMeta(
    'sourceCode',
  );
  @override
  late final GeneratedColumn<String> sourceCode = GeneratedColumn<String>(
    'source_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destCodeMeta = const VerificationMeta(
    'destCode',
  );
  @override
  late final GeneratedColumn<String> destCode = GeneratedColumn<String>(
    'dest_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destNameMeta = const VerificationMeta(
    'destName',
  );
  @override
  late final GeneratedColumn<String> destName = GeneratedColumn<String>(
    'dest_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departureTimeMeta = const VerificationMeta(
    'departureTime',
  );
  @override
  late final GeneratedColumn<String> departureTime = GeneratedColumn<String>(
    'departure_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _searchedAtMeta = const VerificationMeta(
    'searchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
    'searched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceCode,
    sourceName,
    destCode,
    destName,
    departureTime,
    searchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trip_search_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<TripSearchHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_code')) {
      context.handle(
        _sourceCodeMeta,
        sourceCode.isAcceptableOrUnknown(data['source_code']!, _sourceCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceCodeMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('dest_code')) {
      context.handle(
        _destCodeMeta,
        destCode.isAcceptableOrUnknown(data['dest_code']!, _destCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_destCodeMeta);
    }
    if (data.containsKey('dest_name')) {
      context.handle(
        _destNameMeta,
        destName.isAcceptableOrUnknown(data['dest_name']!, _destNameMeta),
      );
    } else if (isInserting) {
      context.missing(_destNameMeta);
    }
    if (data.containsKey('departure_time')) {
      context.handle(
        _departureTimeMeta,
        departureTime.isAcceptableOrUnknown(
          data['departure_time']!,
          _departureTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_departureTimeMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
        _searchedAtMeta,
        searchedAt.isAcceptableOrUnknown(data['searched_at']!, _searchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TripSearchHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TripSearchHistory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sourceCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_code'],
      )!,
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      )!,
      destCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dest_code'],
      )!,
      destName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dest_name'],
      )!,
      departureTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}departure_time'],
      )!,
      searchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}searched_at'],
      )!,
    );
  }

  @override
  $TripSearchHistoriesTable createAlias(String alias) {
    return $TripSearchHistoriesTable(attachedDatabase, alias);
  }
}

class TripSearchHistory extends DataClass
    implements Insertable<TripSearchHistory> {
  final int id;
  final String sourceCode;
  final String sourceName;
  final String destCode;
  final String destName;
  final String departureTime;
  final DateTime searchedAt;
  const TripSearchHistory({
    required this.id,
    required this.sourceCode,
    required this.sourceName,
    required this.destCode,
    required this.destName,
    required this.departureTime,
    required this.searchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_code'] = Variable<String>(sourceCode);
    map['source_name'] = Variable<String>(sourceName);
    map['dest_code'] = Variable<String>(destCode);
    map['dest_name'] = Variable<String>(destName);
    map['departure_time'] = Variable<String>(departureTime);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  TripSearchHistoriesCompanion toCompanion(bool nullToAbsent) {
    return TripSearchHistoriesCompanion(
      id: Value(id),
      sourceCode: Value(sourceCode),
      sourceName: Value(sourceName),
      destCode: Value(destCode),
      destName: Value(destName),
      departureTime: Value(departureTime),
      searchedAt: Value(searchedAt),
    );
  }

  factory TripSearchHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TripSearchHistory(
      id: serializer.fromJson<int>(json['id']),
      sourceCode: serializer.fromJson<String>(json['sourceCode']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      destCode: serializer.fromJson<String>(json['destCode']),
      destName: serializer.fromJson<String>(json['destName']),
      departureTime: serializer.fromJson<String>(json['departureTime']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceCode': serializer.toJson<String>(sourceCode),
      'sourceName': serializer.toJson<String>(sourceName),
      'destCode': serializer.toJson<String>(destCode),
      'destName': serializer.toJson<String>(destName),
      'departureTime': serializer.toJson<String>(departureTime),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  TripSearchHistory copyWith({
    int? id,
    String? sourceCode,
    String? sourceName,
    String? destCode,
    String? destName,
    String? departureTime,
    DateTime? searchedAt,
  }) => TripSearchHistory(
    id: id ?? this.id,
    sourceCode: sourceCode ?? this.sourceCode,
    sourceName: sourceName ?? this.sourceName,
    destCode: destCode ?? this.destCode,
    destName: destName ?? this.destName,
    departureTime: departureTime ?? this.departureTime,
    searchedAt: searchedAt ?? this.searchedAt,
  );
  TripSearchHistory copyWithCompanion(TripSearchHistoriesCompanion data) {
    return TripSearchHistory(
      id: data.id.present ? data.id.value : this.id,
      sourceCode: data.sourceCode.present
          ? data.sourceCode.value
          : this.sourceCode,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      destCode: data.destCode.present ? data.destCode.value : this.destCode,
      destName: data.destName.present ? data.destName.value : this.destName,
      departureTime: data.departureTime.present
          ? data.departureTime.value
          : this.departureTime,
      searchedAt: data.searchedAt.present
          ? data.searchedAt.value
          : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TripSearchHistory(')
          ..write('id: $id, ')
          ..write('sourceCode: $sourceCode, ')
          ..write('sourceName: $sourceName, ')
          ..write('destCode: $destCode, ')
          ..write('destName: $destName, ')
          ..write('departureTime: $departureTime, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourceCode,
    sourceName,
    destCode,
    destName,
    departureTime,
    searchedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripSearchHistory &&
          other.id == this.id &&
          other.sourceCode == this.sourceCode &&
          other.sourceName == this.sourceName &&
          other.destCode == this.destCode &&
          other.destName == this.destName &&
          other.departureTime == this.departureTime &&
          other.searchedAt == this.searchedAt);
}

class TripSearchHistoriesCompanion extends UpdateCompanion<TripSearchHistory> {
  final Value<int> id;
  final Value<String> sourceCode;
  final Value<String> sourceName;
  final Value<String> destCode;
  final Value<String> destName;
  final Value<String> departureTime;
  final Value<DateTime> searchedAt;
  const TripSearchHistoriesCompanion({
    this.id = const Value.absent(),
    this.sourceCode = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.destCode = const Value.absent(),
    this.destName = const Value.absent(),
    this.departureTime = const Value.absent(),
    this.searchedAt = const Value.absent(),
  });
  TripSearchHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required String sourceCode,
    required String sourceName,
    required String destCode,
    required String destName,
    required String departureTime,
    required DateTime searchedAt,
  }) : sourceCode = Value(sourceCode),
       sourceName = Value(sourceName),
       destCode = Value(destCode),
       destName = Value(destName),
       departureTime = Value(departureTime),
       searchedAt = Value(searchedAt);
  static Insertable<TripSearchHistory> custom({
    Expression<int>? id,
    Expression<String>? sourceCode,
    Expression<String>? sourceName,
    Expression<String>? destCode,
    Expression<String>? destName,
    Expression<String>? departureTime,
    Expression<DateTime>? searchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceCode != null) 'source_code': sourceCode,
      if (sourceName != null) 'source_name': sourceName,
      if (destCode != null) 'dest_code': destCode,
      if (destName != null) 'dest_name': destName,
      if (departureTime != null) 'departure_time': departureTime,
      if (searchedAt != null) 'searched_at': searchedAt,
    });
  }

  TripSearchHistoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? sourceCode,
    Value<String>? sourceName,
    Value<String>? destCode,
    Value<String>? destName,
    Value<String>? departureTime,
    Value<DateTime>? searchedAt,
  }) {
    return TripSearchHistoriesCompanion(
      id: id ?? this.id,
      sourceCode: sourceCode ?? this.sourceCode,
      sourceName: sourceName ?? this.sourceName,
      destCode: destCode ?? this.destCode,
      destName: destName ?? this.destName,
      departureTime: departureTime ?? this.departureTime,
      searchedAt: searchedAt ?? this.searchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceCode.present) {
      map['source_code'] = Variable<String>(sourceCode.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (destCode.present) {
      map['dest_code'] = Variable<String>(destCode.value);
    }
    if (destName.present) {
      map['dest_name'] = Variable<String>(destName.value);
    }
    if (departureTime.present) {
      map['departure_time'] = Variable<String>(departureTime.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripSearchHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('sourceCode: $sourceCode, ')
          ..write('sourceName: $sourceName, ')
          ..write('destCode: $destCode, ')
          ..write('destName: $destName, ')
          ..write('departureTime: $departureTime, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TripSearchHistoriesTable tripSearchHistories =
      $TripSearchHistoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tripSearchHistories];
}

typedef $$TripSearchHistoriesTableCreateCompanionBuilder =
    TripSearchHistoriesCompanion Function({
      Value<int> id,
      required String sourceCode,
      required String sourceName,
      required String destCode,
      required String destName,
      required String departureTime,
      required DateTime searchedAt,
    });
typedef $$TripSearchHistoriesTableUpdateCompanionBuilder =
    TripSearchHistoriesCompanion Function({
      Value<int> id,
      Value<String> sourceCode,
      Value<String> sourceName,
      Value<String> destCode,
      Value<String> destName,
      Value<String> departureTime,
      Value<DateTime> searchedAt,
    });

class $$TripSearchHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TripSearchHistoriesTable> {
  $$TripSearchHistoriesTableFilterComposer({
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

  ColumnFilters<String> get sourceCode => $composableBuilder(
    column: $table.sourceCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destCode => $composableBuilder(
    column: $table.destCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destName => $composableBuilder(
    column: $table.destName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TripSearchHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TripSearchHistoriesTable> {
  $$TripSearchHistoriesTableOrderingComposer({
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

  ColumnOrderings<String> get sourceCode => $composableBuilder(
    column: $table.sourceCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destCode => $composableBuilder(
    column: $table.destCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destName => $composableBuilder(
    column: $table.destName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TripSearchHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TripSearchHistoriesTable> {
  $$TripSearchHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceCode => $composableBuilder(
    column: $table.sourceCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get destCode =>
      $composableBuilder(column: $table.destCode, builder: (column) => column);

  GeneratedColumn<String> get destName =>
      $composableBuilder(column: $table.destName, builder: (column) => column);

  GeneratedColumn<String> get departureTime => $composableBuilder(
    column: $table.departureTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
    column: $table.searchedAt,
    builder: (column) => column,
  );
}

class $$TripSearchHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TripSearchHistoriesTable,
          TripSearchHistory,
          $$TripSearchHistoriesTableFilterComposer,
          $$TripSearchHistoriesTableOrderingComposer,
          $$TripSearchHistoriesTableAnnotationComposer,
          $$TripSearchHistoriesTableCreateCompanionBuilder,
          $$TripSearchHistoriesTableUpdateCompanionBuilder,
          (
            TripSearchHistory,
            BaseReferences<
              _$AppDatabase,
              $TripSearchHistoriesTable,
              TripSearchHistory
            >,
          ),
          TripSearchHistory,
          PrefetchHooks Function()
        > {
  $$TripSearchHistoriesTableTableManager(
    _$AppDatabase db,
    $TripSearchHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TripSearchHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TripSearchHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TripSearchHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sourceCode = const Value.absent(),
                Value<String> sourceName = const Value.absent(),
                Value<String> destCode = const Value.absent(),
                Value<String> destName = const Value.absent(),
                Value<String> departureTime = const Value.absent(),
                Value<DateTime> searchedAt = const Value.absent(),
              }) => TripSearchHistoriesCompanion(
                id: id,
                sourceCode: sourceCode,
                sourceName: sourceName,
                destCode: destCode,
                destName: destName,
                departureTime: departureTime,
                searchedAt: searchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sourceCode,
                required String sourceName,
                required String destCode,
                required String destName,
                required String departureTime,
                required DateTime searchedAt,
              }) => TripSearchHistoriesCompanion.insert(
                id: id,
                sourceCode: sourceCode,
                sourceName: sourceName,
                destCode: destCode,
                destName: destName,
                departureTime: departureTime,
                searchedAt: searchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TripSearchHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TripSearchHistoriesTable,
      TripSearchHistory,
      $$TripSearchHistoriesTableFilterComposer,
      $$TripSearchHistoriesTableOrderingComposer,
      $$TripSearchHistoriesTableAnnotationComposer,
      $$TripSearchHistoriesTableCreateCompanionBuilder,
      $$TripSearchHistoriesTableUpdateCompanionBuilder,
      (
        TripSearchHistory,
        BaseReferences<
          _$AppDatabase,
          $TripSearchHistoriesTable,
          TripSearchHistory
        >,
      ),
      TripSearchHistory,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TripSearchHistoriesTableTableManager get tripSearchHistories =>
      $$TripSearchHistoriesTableTableManager(_db, _db.tripSearchHistories);
}
