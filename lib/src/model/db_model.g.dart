// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Product.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Product TABLE
class TableProduct extends SqfEntityTableBase {
  TableProduct() {
    // declare properties of EntityTable
    tableName = 'products';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_unique;
    useSoftDeleting = true;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('title', DbType.text, isUnique: true, isNotNull: true),
      SqfEntityFieldBase('description', DbType.text),
      SqfEntityFieldBase('image_url', DbType.text),
      SqfEntityFieldBase('selling_price', DbType.real, isNotNull: true),
      SqfEntityFieldBase('cost_price', DbType.real, isNotNull: true),
      SqfEntityFieldBase('quantity', DbType.integer, isNotNull: true),
      SqfEntityFieldBase('created_at', DbType.time, isNotNull: true),
      SqfEntityFieldBase('updated_at', DbType.time, isNotNull: true),
    ];
    super.init();
  }
  static SqfEntityTableBase? _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableProduct();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class MyProductManager extends SqfEntityModelProvider {
  MyProductManager() {
    databaseName = myDbModel.databaseName;
    password = myDbModel.password;
    dbVersion = myDbModel.dbVersion;
    preSaveAction = myDbModel.preSaveAction;
    logFunction = myDbModel.logFunction;
    databaseTables = [
      TableProduct.getInstance,
    ];

    bundledDatabasePath = myDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
    databasePath = myDbModel.databasePath;
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Product
class Product extends TableBase {
  Product(
      {this.id,
      this.title,
      this.description,
      this.image_url,
      this.selling_price,
      this.cost_price,
      this.quantity,
      this.created_at,
      this.updated_at,
      this.isDeleted}) {
    _setDefaultValues();
    softDeleteActivated = true;
  }
  Product.withFields(
      this.id,
      this.title,
      this.description,
      this.image_url,
      this.selling_price,
      this.cost_price,
      this.quantity,
      this.created_at,
      this.updated_at,
      this.isDeleted) {
    _setDefaultValues();
  }
  Product.withId(
      this.id,
      this.title,
      this.description,
      this.image_url,
      this.selling_price,
      this.cost_price,
      this.quantity,
      this.created_at,
      this.updated_at,
      this.isDeleted) {
    _setDefaultValues();
  }
  // fromMap v2.0
  Product.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    id = int.tryParse(o['id'].toString());
    if (o['title'] != null) {
      title = o['title'].toString();
    }
    if (o['description'] != null) {
      description = o['description'].toString();
    }
    if (o['image_url'] != null) {
      image_url = o['image_url'].toString();
    }
    if (o['selling_price'] != null) {
      selling_price = double.tryParse(o['selling_price'].toString());
    }
    if (o['cost_price'] != null) {
      cost_price = double.tryParse(o['cost_price'].toString());
    }
    if (o['quantity'] != null) {
      quantity = int.tryParse(o['quantity'].toString());
    }
    if (o['created_at'] != null) {
      created_at = TimeOfDay(
          hour: int.parse(o['created_at'].toString().split(':')[0]),
          minute: int.parse(o['created_at'].toString().split(':')[1]));
    }
    if (o['updated_at'] != null) {
      updated_at = TimeOfDay(
          hour: int.parse(o['updated_at'].toString().split(':')[0]),
          minute: int.parse(o['updated_at'].toString().split(':')[1]));
    }
    isDeleted = o['isDeleted'] != null
        ? o['isDeleted'] == 1 || o['isDeleted'] == true
        : null;

    isSaved = true;
  }
  // FIELDS (Product)
  int? id;
  String? title;
  String? description;
  String? image_url;
  double? selling_price;
  double? cost_price;
  int? quantity;
  TimeOfDay? created_at;
  TimeOfDay? updated_at;
  bool? isDeleted;
  bool? isSaved;
  // end FIELDS (Product)

  static const bool _softDeleteActivated = true;
  ProductManager? __mnProduct;

  ProductManager get _mnProduct {
    return __mnProduct = __mnProduct ?? ProductManager();
  }

  // METHODS
  @override
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (title != null || !forView) {
      map['title'] = title;
    }
    if (description != null || !forView) {
      map['description'] = description;
    }
    if (image_url != null || !forView) {
      map['image_url'] = image_url;
    }
    if (selling_price != null || !forView) {
      map['selling_price'] = selling_price;
    }
    if (cost_price != null || !forView) {
      map['cost_price'] = cost_price;
    }
    if (quantity != null || !forView) {
      map['quantity'] = quantity;
    }
    if (created_at != null) {
      map['created_at'] =
          '${created_at!.hour.toString().padLeft(2, '0')}:${created_at!.minute.toString().padLeft(2, '0')}:00';
    } else if (created_at != null || !forView) {
      map['created_at'] = null;
    }
    if (updated_at != null) {
      map['updated_at'] =
          '${updated_at!.hour.toString().padLeft(2, '0')}:${updated_at!.minute.toString().padLeft(2, '0')}:00';
    } else if (updated_at != null || !forView) {
      map['updated_at'] = null;
    }
    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted! ? 1 : 0) : isDeleted;
    }

    return map;
  }

  @override
  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (title != null || !forView) {
      map['title'] = title;
    }
    if (description != null || !forView) {
      map['description'] = description;
    }
    if (image_url != null || !forView) {
      map['image_url'] = image_url;
    }
    if (selling_price != null || !forView) {
      map['selling_price'] = selling_price;
    }
    if (cost_price != null || !forView) {
      map['cost_price'] = cost_price;
    }
    if (quantity != null || !forView) {
      map['quantity'] = quantity;
    }
    if (created_at != null) {
      map['created_at'] =
          '${created_at!.hour.toString().padLeft(2, '0')}:${created_at!.minute.toString().padLeft(2, '0')}:00';
    } else if (created_at != null || !forView) {
      map['created_at'] = null;
    }
    if (updated_at != null) {
      map['updated_at'] =
          '${updated_at!.hour.toString().padLeft(2, '0')}:${updated_at!.minute.toString().padLeft(2, '0')}:00';
    } else if (updated_at != null || !forView) {
      map['updated_at'] = null;
    }
    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted! ? 1 : 0) : isDeleted;
    }

    return map;
  }

  /// This method returns Json String [Product]
  @override
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [Product]
  @override
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  @override
  List<dynamic> toArgs() {
    return [
      id,
      title,
      description,
      image_url,
      selling_price,
      cost_price,
      quantity,
      created_at != null
          ? defaultTimeFormat.format(toDateTime(created_at!))
          : null,
      updated_at != null
          ? defaultTimeFormat.format(toDateTime(updated_at!))
          : null,
      isDeleted
    ];
  }

  @override
  List<dynamic> toArgsWithIds() {
    return [
      id,
      title,
      description,
      image_url,
      selling_price,
      cost_price,
      quantity,
      created_at != null
          ? defaultTimeFormat.format(toDateTime(created_at!))
          : null,
      updated_at != null
          ? defaultTimeFormat.format(toDateTime(updated_at!))
          : null,
      isDeleted
    ];
  }

  static Future<List<Product>?> fromWebUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Product.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(Uri uri, {Map<String, String>? headers}) {
    return http.post(uri, headers: headers, body: toJson());
  }

  static Future<List<Product>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Product>[];
    try {
      objList = list
          .map((product) => Product.fromMap(product as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Product.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Product>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields,
      bool setDefaultValues = true}) async {
    final List<Product> objList = <Product>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Product.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Product by ID if exist, otherwise returns null
  /// Primary Keys: int? id
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: getById(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>returns [Product] if exist, otherwise returns null
  Future<Product?> getById(int? id,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    if (id == null) {
      return null;
    }
    Product? obj;
    final data = await _mnProduct.getById([id]);
    if (data.length != 0) {
      obj = Product.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Product) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns id
  @override
  Future<int?> save({bool ignoreBatch = true}) async {
    if (id == null || id == 0 || !isSaved!) {
      await _mnProduct.insert(this, ignoreBatch);
      if (saveResult!.success) {
        isSaved = true;
      }
    } else {
      await _mnProduct.update(this);
    }

    return id;
  }

  /// Saves the (Product) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns id
  @override
  Future<int?> saveOrThrow({bool ignoreBatch = true}) async {
    if (id == null || id == 0 || !isSaved!) {
      await _mnProduct.insertOrThrow(this, ignoreBatch);
      if (saveResult != null && saveResult!.success) {
        isSaved = true;
      }
      isInsert = true;
    } else {
      // id= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnProduct.updateOrThrow(this);
    }

    return id;
  }

  /// saveAll method saves the sent List<Product> as a bulk in one transaction
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<Product> products,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    List<dynamic>? result = [];
    // If there is no open transaction, start one
    final isStartedBatch = await MyProductManager().batchStart();
    for (final obj in products) {
      await obj.save(ignoreBatch: false);
    }
    if (!isStartedBatch) {
      result = await MyProductManager().batchCommit(
          exclusive: exclusive,
          noResult: noResult,
          continueOnError: continueOnError);
    }
    return result!;
  }

  /// Updates if the record exists, otherwise adds a new row
  /// <returns>Returns id
  @override
  Future<int?> upsert({bool ignoreBatch = true}) async {
    try {
      final result = await _mnProduct.rawInsert(
          'INSERT OR REPLACE INTO products (id, title, description, image_url, selling_price, cost_price, quantity, created_at, updated_at,isDeleted)  VALUES (?,?,?,?,?,?,?,?,?,?)',
          [
            id,
            title,
            description,
            image_url,
            selling_price,
            cost_price,
            quantity,
            created_at != null
                ? defaultTimeFormat.format(toDateTime(created_at!))
                : null,
            updated_at != null
                ? defaultTimeFormat.format(toDateTime(updated_at!))
                : null,
            isDeleted
          ],
          ignoreBatch);
      if (result! > 0) {
        saveResult = BoolResult(
            success: true,
            successMessage: 'Product id=$id updated successfully');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Product id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Product Save failed. Error: ${e.toString()}');
      return null;
    }
  }

  /// inserts or replaces the sent List<<Product>> as a bulk in one transaction.
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  /// Returns a BoolCommitResult
  @override
  Future<BoolCommitResult> upsertAll(List<Product> products,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    final results = await _mnProduct.rawInsertAll(
        'INSERT OR REPLACE INTO products (id, title, description, image_url, selling_price, cost_price, quantity, created_at, updated_at,isDeleted)  VALUES (?,?,?,?,?,?,?,?,?,?)',
        products,
        exclusive: exclusive,
        noResult: noResult,
        continueOnError: continueOnError);
    return results;
  }

  /// Deletes Product

  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    debugPrint('SQFENTITIY: delete Product invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete || isDeleted!) {
      return _mnProduct
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnProduct.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  /// Recover Product

  /// <returns>BoolResult res.success=Recovered, not res.success=Can not recovered
  @override
  Future<BoolResult> recover([bool recoverChilds = true]) async {
    debugPrint('SQFENTITIY: recover Product invoked (id=$id)');
    {
      return _mnProduct.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 0});
    }
  }

  @override
  ProductFilterBuilder select(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return ProductFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect;
  }

  @override
  ProductFilterBuilder distinct(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return ProductFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isSaved = false;
    isDeleted = isDeleted ?? false;
  }

  @override
  void rollbackPk() {
    if (isInsert == true) {
      id = null;
    }
  }

  // END METHODS
  // BEGIN CUSTOM CODE
  /*
      you can define customCode property of your SqfEntityTable constant. For example:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODE
}
// endregion product

// region ProductField
class ProductField extends FilterBase {
  ProductField(ProductFilterBuilder productFB) : super(productFB);

  @override
  ProductFilterBuilder equals(dynamic pValue) {
    return super.equals(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder equalsOrNull(dynamic pValue) {
    return super.equalsOrNull(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder isNull() {
    return super.isNull() as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder contains(dynamic pValue) {
    return super.contains(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder startsWith(dynamic pValue) {
    return super.startsWith(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder endsWith(dynamic pValue) {
    return super.endsWith(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder between(dynamic pFirst, dynamic pLast) {
    return super.between(pFirst, pLast) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder greaterThan(dynamic pValue) {
    return super.greaterThan(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder lessThan(dynamic pValue) {
    return super.lessThan(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder greaterThanOrEquals(dynamic pValue) {
    return super.greaterThanOrEquals(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder lessThanOrEquals(dynamic pValue) {
    return super.lessThanOrEquals(pValue) as ProductFilterBuilder;
  }

  @override
  ProductFilterBuilder inValues(dynamic pValue) {
    return super.inValues(pValue) as ProductFilterBuilder;
  }

  @override
  ProductField get not {
    return super.not as ProductField;
  }
}
// endregion ProductField

// region ProductFilterBuilder
class ProductFilterBuilder extends ConjunctionBase {
  ProductFilterBuilder(Product obj, bool? getIsDeleted)
      : super(obj, getIsDeleted) {
    _mnProduct = obj._mnProduct;
    _softDeleteActivated = obj.softDeleteActivated;
  }

  bool _softDeleteActivated = false;
  ProductManager? _mnProduct;

  /// put the sql keyword 'AND'
  @override
  ProductFilterBuilder get and {
    super.and;
    return this;
  }

  /// put the sql keyword 'OR'
  @override
  ProductFilterBuilder get or {
    super.or;
    return this;
  }

  /// open parentheses
  @override
  ProductFilterBuilder get startBlock {
    super.startBlock;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  @override
  ProductFilterBuilder where(String? whereCriteria, {dynamic parameterValue}) {
    super.where(whereCriteria, parameterValue: parameterValue);
    return this;
  }

  /// page = page number,
  /// pagesize = row(s) per page
  @override
  ProductFilterBuilder page(int page, int pagesize) {
    super.page(page, pagesize);
    return this;
  }

  /// int count = LIMIT
  @override
  ProductFilterBuilder top(int count) {
    super.top(count);
    return this;
  }

  /// close parentheses
  @override
  ProductFilterBuilder get endBlock {
    super.endBlock;
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  ProductFilterBuilder orderBy(dynamic argFields) {
    super.orderBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  ProductFilterBuilder orderByDesc(dynamic argFields) {
    super.orderByDesc(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  ProductFilterBuilder groupBy(dynamic argFields) {
    super.groupBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  ProductFilterBuilder having(dynamic argFields) {
    super.having(argFields);
    return this;
  }

  ProductField _setField(ProductField? field, String colName, DbType dbtype) {
    return ProductField(this)
      ..param = DbParameter(
          dbType: dbtype, columnName: colName, wStartBlock: openedBlock);
  }

  ProductField? _id;
  ProductField get id {
    return _id = _setField(_id, 'id', DbType.integer);
  }

  ProductField? _title;
  ProductField get title {
    return _title = _setField(_title, 'title', DbType.text);
  }

  ProductField? _description;
  ProductField get description {
    return _description = _setField(_description, 'description', DbType.text);
  }

  ProductField? _image_url;
  ProductField get image_url {
    return _image_url = _setField(_image_url, 'image_url', DbType.text);
  }

  ProductField? _selling_price;
  ProductField get selling_price {
    return _selling_price =
        _setField(_selling_price, 'selling_price', DbType.real);
  }

  ProductField? _cost_price;
  ProductField get cost_price {
    return _cost_price = _setField(_cost_price, 'cost_price', DbType.real);
  }

  ProductField? _quantity;
  ProductField get quantity {
    return _quantity = _setField(_quantity, 'quantity', DbType.integer);
  }

  ProductField? _created_at;
  ProductField get created_at {
    return _created_at = _setField(_created_at, 'created_at', DbType.time);
  }

  ProductField? _updated_at;
  ProductField get updated_at {
    return _updated_at = _setField(_updated_at, 'updated_at', DbType.time);
  }

  ProductField? _isDeleted;
  ProductField get isDeleted {
    return _isDeleted = _setField(_isDeleted, 'isDeleted', DbType.bool);
  }

  /// Deletes List<Product> bulk by query
  ///
  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    buildParameters();
    var r = BoolResult(success: false);

    if (_softDeleteActivated && !hardDelete) {
      r = await _mnProduct!.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _mnProduct!.delete(qparams);
    }
    return r;
  }

  /// Recover List<Product> bulk by query
  @override
  Future<BoolResult> recover() async {
    buildParameters(getIsDeleted: true);
    debugPrint('SQFENTITIY: recover Product bulk invoked');
    return _mnProduct!.updateBatch(qparams, {'isDeleted': 0});
  }

  /// using:
  /// update({'fieldName': Value})
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  @override
  Future<BoolResult> update(Map<String, dynamic> values) {
    buildParameters();
    if (qparams.limit! > 0 || qparams.offset! > 0) {
      qparams.whereString =
          'id IN (SELECT id from products ${qparams.whereString!.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit! > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset! > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _mnProduct!.updateBatch(qparams, values);
  }

  /// This method always returns [Product] Obj if exist, otherwise returns null
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Product?
  @override
  Future<Product?> toSingle(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    buildParameters(pSize: 1);
    final objFuture = _mnProduct!.toList(qparams);
    final data = await objFuture;
    Product? obj;
    if (data.isNotEmpty) {
      obj = Product.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns [Product]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Product?
  @override
  Future<Product> toSingleOrDefault(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    return await toSingle(
            preload: preload,
            preloadFields: preloadFields,
            loadParents: loadParents,
            loadedFields: loadedFields) ??
        Product();
  }

  /// This method returns int. [Product]
  /// <returns>int
  @override
  Future<int> toCount([VoidCallback Function(int c)? productCount]) async {
    buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final productsFuture = await _mnProduct!.toList(qparams);
    final int count = productsFuture[0]['CNT'] as int;
    if (productCount != null) {
      productCount(count);
    }
    return count;
  }

  /// This method returns List<Product> [Product]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toList(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>List<Product>
  @override
  Future<List<Product>> toList(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    final data = await toMapList();
    final List<Product> productsData = await Product.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return productsData;
  }

  /// This method returns Json String [Product]
  @override
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [Product]
  @override
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [Product]
  /// <returns>List<dynamic>
  @override
  Future<List<dynamic>> toMapList() async {
    buildParameters();
    return await _mnProduct!.toList(qparams);
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [Product]
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  /// <returns>List<String>
  @override
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParams = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParams) {
      buildParameters();
    }
    _retVal['sql'] = 'SELECT `id` FROM products WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  @override
  Future<List<int>> toListPrimaryKey([bool buildParams = true]) async {
    if (buildParams) {
      buildParameters();
    }
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _mnProduct!.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [Product]
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  @override
  Future<List<dynamic>> toListObject() async {
    buildParameters();

    final objectFuture = _mnProduct!.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  /// Sample usage: await Product.select(columnsToSelect: ['columnName']).toListString()
  @override
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o)? listString]) async {
    buildParameters();

    final objectFuture = _mnProduct!.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns![0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion ProductFilterBuilder

// region ProductFields
class ProductFields {
  static TableField? _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField? _fTitle;
  static TableField get title {
    return _fTitle =
        _fTitle ?? SqlSyntax.setField(_fTitle, 'title', DbType.text);
  }

  static TableField? _fDescription;
  static TableField get description {
    return _fDescription = _fDescription ??
        SqlSyntax.setField(_fDescription, 'description', DbType.text);
  }

  static TableField? _fImage_url;
  static TableField get image_url {
    return _fImage_url = _fImage_url ??
        SqlSyntax.setField(_fImage_url, 'image_url', DbType.text);
  }

  static TableField? _fSelling_price;
  static TableField get selling_price {
    return _fSelling_price = _fSelling_price ??
        SqlSyntax.setField(_fSelling_price, 'selling_price', DbType.real);
  }

  static TableField? _fCost_price;
  static TableField get cost_price {
    return _fCost_price = _fCost_price ??
        SqlSyntax.setField(_fCost_price, 'cost_price', DbType.real);
  }

  static TableField? _fQuantity;
  static TableField get quantity {
    return _fQuantity = _fQuantity ??
        SqlSyntax.setField(_fQuantity, 'quantity', DbType.integer);
  }

  static TableField? _fCreated_at;
  static TableField get created_at {
    return _fCreated_at = _fCreated_at ??
        SqlSyntax.setField(_fCreated_at, 'created_at', DbType.time);
  }

  static TableField? _fUpdated_at;
  static TableField get updated_at {
    return _fUpdated_at = _fUpdated_at ??
        SqlSyntax.setField(_fUpdated_at, 'updated_at', DbType.time);
  }

  static TableField? _fIsDeleted;
  static TableField get isDeleted {
    return _fIsDeleted = _fIsDeleted ??
        SqlSyntax.setField(_fIsDeleted, 'isDeleted', DbType.integer);
  }
}
// endregion ProductFields

//region ProductManager
class ProductManager extends SqfEntityProvider {
  ProductManager()
      : super(MyProductManager(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static const String _tableName = 'products';
  static const List<String> _primaryKeyList = ['id'];
  static const String _whereStr = 'id=?';
}

//endregion ProductManager
class MyProductManagerSequenceManager extends SqfEntityProvider {
  MyProductManagerSequenceManager() : super(MyProductManager());
}
// END OF ENTITIES
