// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  IssueItemDao _issueItemDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `IssueItem` (`_name` TEXT, `_description` TEXT, `_estimateTime` REAL, `_logTime` REAL, `issueState` TEXT, PRIMARY KEY (`_name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  IssueItemDao get issueItemDao {
    return _issueItemDaoInstance ??= _$IssueItemDao(database, changeListener);
  }
}

class _$IssueItemDao extends IssueItemDao {
  _$IssueItemDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _issueItemInsertionAdapter = InsertionAdapter(
            database,
            'IssueItem',
            (IssueItem item) => <String, dynamic>{
                  '_name': item.name,
                  '_description': item.description,
                  '_estimateTime': item.estimateTime,
                  '_logTime': item.logTime,
                  'issueState': item.issueState
                }),
        _issueItemUpdateAdapter = UpdateAdapter(
            database,
            'IssueItem',
            ['_name'],
            (IssueItem item) => <String, dynamic>{
                  '_name': item.name,
                  '_description': item.description,
                  '_estimateTime': item.estimateTime,
                  '_logTime': item.logTime,
                  'issueState': item.issueState
                }),
        _issueItemDeletionAdapter = DeletionAdapter(
            database,
            'IssueItem',
            ['_name'],
            (IssueItem item) => <String, dynamic>{
                  '_name': item.name,
                  '_description': item.description,
                  '_estimateTime': item.estimateTime,
                  '_logTime': item.logTime,
                  'issueState': item.issueState
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IssueItem> _issueItemInsertionAdapter;

  final UpdateAdapter<IssueItem> _issueItemUpdateAdapter;

  final DeletionAdapter<IssueItem> _issueItemDeletionAdapter;

  @override
  Future<List<IssueItem>> findAllIssueItem() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, dynamic> row) => IssueItem(row['_name'] as String,
            row['_description'] as String, row['_estimateTime'] as double));
  }

  @override
  Future<IssueItem> findIssueItemById(int id) async {
    return _queryAdapter.query('SELECT * FROM Person WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => IssueItem(row['_name'] as String,
            row['_description'] as String, row['_estimateTime'] as double));
  }

  @override
  Future<void> insertIssueItem(IssueItem issueItem) async {
    await _issueItemInsertionAdapter.insert(
        issueItem, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateIssueItemList(List<IssueItem> issueItemList) {
    return _issueItemUpdateAdapter.updateListAndReturnChangedRows(
        issueItemList, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateIssueItem(IssueItem issueItem) {
    return _issueItemUpdateAdapter.updateAndReturnChangedRows(
        issueItem, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteIssueItem(IssueItem issueItem) {
    return _issueItemDeletionAdapter.deleteAndReturnChangedRows(issueItem);
  }
}
