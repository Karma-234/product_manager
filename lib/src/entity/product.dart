import 'package:flat_orm/flat_orm.dart';
import 'package:uuid/uuid.dart';

@entity
class Products {
  @primaryKey
  final String id;

  final String title;
  final String description;
  final double costPrice;
  final double sellingPrice;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.costPrice,
      required this.sellingPrice,
      required this.createdAt,
      required this.updatedAt,
      required this.imageUrl});
}
