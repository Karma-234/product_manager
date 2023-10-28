
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:product_manager/src/data/product_manager.dart';
import 'package:product_manager/src/entity/product.dart';

class ProductController extends GetxController {
  static ProductController get controller => Get.find();
  final _database = $FlatProductManager.databaseBuilder('product_manager.db');
  ProductManager? _productManager;
  RxString error = ''.obs;
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxString createdAt = ''.obs;
  RxString updatedAt = ''.obs;
  RxDouble costPrice = 0.0.obs;
  RxDouble sellingPrice = 0.0.obs;
  RxInt qaunttity = 0.obs;
  RxString imageUrl = ''.obs;
  RxBool isLoading = false.obs;
  Rx<Uint8List>? tempImage;
  RxList<Products>? _products;
  RxList<Products> get product => _products ?? <Products>[].obs;
  Rx<Stream<List<Products>>>? get allProducts =>
      _productManager?.productDao.findAllProducts().obs;

  Future<void> initDatabase() async {
    try {
      isLoading = true.obs;
      _productManager = await _database.build();
      isLoading = false.obs;
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
      debugPrint(error.value);
    }
  }

  List products = [].obs;

  void setProduct(Products product) {
    setCostPrice(product.costPrice.toString());
    setDescription(product.description);
    setTitle(product.title);
    setImageUrl(product.imageUrl);
    setQuantity(product.quantity.toString());
  }

  void setProducts() async {
    try {
      allProducts?.value.forEach((e) {
        _products = [...e].obs;
      });
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
    }
  }

  Future<void> deleteProduct(Products product) async {
    try {
      isLoading = true.obs;
      await _productManager?.productDao.deleteProduct(product);
      isLoading = false.obs;
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
    }
  }

  Future<void> insertProduct(Products product) async {
    try {
      isLoading = true.obs;
      await _productManager?.productDao.insertProduct(product);
      isLoading = false.obs;
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
    }
  }

  void setTitle(String entry) => title = entry.obs;
  void setDescription(String entry) => description = entry.obs;
  void setCostPrice(String entry) =>
      costPrice = (double.tryParse(entry) ?? 0.0).obs;
  void setSellingPrice(String entry) =>
      sellingPrice = (double.tryParse(entry) ?? 0.0).obs;
  void setQuantity(String entry) => qaunttity = (int.tryParse(entry) ?? 0).obs;

  void setTempImage(Uint8List entry) => tempImage = entry.obs;
  void setImageUrl(String entry) => imageUrl = entry.obs;
}
