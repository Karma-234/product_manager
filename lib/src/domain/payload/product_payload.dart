class ProductPayload {
  String? name;
  String? decription;
  double? costPrice;
  double? sellingPrice;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageUrl;

  ProductPayload({
    this.name,
    this.decription,
    this.costPrice,
    this.sellingPrice,
    this.createdAt,
    this.quantity,
    this.updatedAt,
    this.imageUrl,
  });
}
