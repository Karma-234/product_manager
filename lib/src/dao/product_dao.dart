// dao/person_dao.dart

import 'package:flat_orm/flat_orm.dart';
import 'package:product_manager/src/entity/product.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Products')
  Stream<List<Products>> findAllProducts();

  @Query('SELECT * FROM Products WHERE title = :title')
  Stream<Products?> findProductByTitle(String title);

  @insert
  Future<void> insertProduct(Products person);

  @delete
  Future<void> deleteProduct(Products person);

  @Query(
      'UPDATE Products SET updatedAt = :updatedAt, title = :title, description = :description, imageUrl = :imageUrl, costPrice = :costPrice, sellingPrice = :sellingPrice, quantity = :quantity WHERE id = :id')
  Future<void> updateProduct(
    String id,
    String updatedAt,
    String title,
    String description,
    String imageUrl,
    double costPrice,
    double sellingPrice,
    int quantity,
  );
}
