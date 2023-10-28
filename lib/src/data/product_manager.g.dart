// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_manager.dart';

// **************************************************************************
// FlatGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FlatProductManager {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductManagerBuilder databaseBuilder(String name) =>
      _$ProductManagerBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ProductManagerBuilder inMemoryDatabaseBuilder() =>
      _$ProductManagerBuilder(null);
}

class _$ProductManagerBuilder {
  _$ProductManagerBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ProductManagerBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ProductManagerBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ProductManager> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ProductManager();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ProductManager extends ProductManager {
  _$ProductManager([StreamController<Set<String>>? listener]) {
    changeListener = listener ?? StreamController<Set<String>>.broadcast();
  }

  ProductDao? _productDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
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
            'CREATE TABLE IF NOT EXISTS `Products` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `costPrice` REAL NOT NULL, `sellingPrice` REAL NOT NULL, `quantity` INTEGER NOT NULL, `createdAt` TEXT NOT NULL, `updatedAt` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  Future<T> transaction<T>(Future<T> Function(dynamic) action) async {
    if (database is sqflite.Transaction) {
      return action(this);
    } else {
      final _changeListener = StreamController<Set<String>>.broadcast();
      final Set<String> _events = {};
      _changeListener.stream.listen(_events.addAll);
      final T result = await (database as sqflite.Database).transaction<T>(
          (transaction) => action(
              _$ProductManager(_changeListener)..database = transaction));
      await _changeListener.close();
      changeListener.add(_events);
      return result;
    }
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??=
        _$ProductDao(database, changeListener, transaction);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
    this.transaction,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _productsInsertionAdapter = InsertionAdapter(
            database,
            'Products',
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'costPrice': item.costPrice,
                  'sellingPrice': item.sellingPrice,
                  'quantity': item.quantity,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'imageUrl': item.imageUrl
                },
            changeListener),
        _productsUpdateAdapter = UpdateAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'costPrice': item.costPrice,
                  'sellingPrice': item.sellingPrice,
                  'quantity': item.quantity,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'imageUrl': item.imageUrl
                },
            changeListener),
        _productsDeletionAdapter = DeletionAdapter(
            database,
            'Products',
            ['id'],
            (Products item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'costPrice': item.costPrice,
                  'sellingPrice': item.sellingPrice,
                  'quantity': item.quantity,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt,
                  'imageUrl': item.imageUrl
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<Set<String>> changeListener;

  final Future<T> Function<T>(Future<T> Function(dynamic)) transaction;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Products> _productsInsertionAdapter;

  final UpdateAdapter<Products> _productsUpdateAdapter;

  final DeletionAdapter<Products> _productsDeletionAdapter;

  @override
  Stream<List<Products>> findAllProducts() {
    return _queryAdapter.queryListStream('SELECT * FROM Products',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            costPrice: row['costPrice'] as double,
            sellingPrice: row['sellingPrice'] as double,
            createdAt: row['createdAt'] as String,
            updatedAt: row['updatedAt'] as String,
            imageUrl: row['imageUrl'] as String,
            quantity: row['quantity'] as int),
        queryableName: 'Products',
        isView: false);
  }

  @override
  Stream<Products?> findProductByTitle(String title) {
    return _queryAdapter.queryStream('SELECT * FROM Products WHERE title = ?1',
        mapper: (Map<String, Object?> row) => Products(
            id: row['id'] as String,
            title: row['title'] as String,
            description: row['description'] as String,
            costPrice: row['costPrice'] as double,
            sellingPrice: row['sellingPrice'] as double,
            createdAt: row['createdAt'] as String,
            updatedAt: row['updatedAt'] as String,
            imageUrl: row['imageUrl'] as String,
            quantity: row['quantity'] as int),
        arguments: [title],
        queryableName: 'Products',
        isView: false);
  }

  @override
  Future<void> insertProduct(Products person) async {
    await _productsInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(Products person) async {
    await _productsUpdateAdapter.update(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduct(Products person) async {
    await _productsDeletionAdapter.delete(person);
  }
}
