import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:product_manager/src/entity/product.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;

part 'sqf_product_manager.g.dart';

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  databaseName: 'ProductManager',
  modelName: 'product_manager',
  databaseTables: [tableProducts],
  password: null,
);
