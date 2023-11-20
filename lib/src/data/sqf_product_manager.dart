import 'dart:convert';

import 'package:product_manager/src/domain/models/products.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'sqf_product_manager.g.dart';

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  databaseName: 'product_manager',
  modelName: 'product_manager',
  databaseTables: [tableProducts],
  password: null,
);
