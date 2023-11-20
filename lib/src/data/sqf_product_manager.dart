import 'dart:convert';

import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'sqf_product_manager.g.dart';

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  databaseName: 'ProductManager',
  modelName: 'product_manager',
  databaseTables: [tableProducts],
  password: null,
);
const tableProducts = SqfEntityTable(
    tableName: 'products',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_unique,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('description', DbType.text),
      SqfEntityField('cost_price', DbType.real, defaultValue: 0),
      SqfEntityField('selling_price', DbType.real, defaultValue: 0),
      SqfEntityField('quantity', DbType.integer, defaultValue: 0),
      SqfEntityField('imageUrl', DbType.text),
      SqfEntityField('created_at', DbType.datetime),
      SqfEntityField('updated_at', DbType.datetime),
    ]);
