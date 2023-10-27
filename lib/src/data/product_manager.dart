import 'dart:async';

import 'package:flat_orm/flat_orm.dart';
import 'package:product_manager/src/dao/product_dao.dart';
import 'package:product_manager/src/entity/product.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'product_manager.g.dart';

@Database(version: 1, entities: [Products])
abstract class ProductManager extends FlatDatabase {
  ProductDao get productDao;
}
