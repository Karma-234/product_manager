import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:product_manager/src/data/product_manager.dart';
import 'package:product_manager/src/entity/product.dart';

class ProductController extends GetxController {
  static ProductController get controller => Get.find();
  final _database = $FlatProductManager.databaseBuilder('product_manager.db');
  Rx<ProductManager>? _productManager;
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
  RxList<Products> products = <Products>[].obs;
  Rx<Stream<List<Products>>>? get allProducts =>
      _productManager?.value.productDao.findAllProducts().obs;

  Future<void> initDatabase() async {
    try {
      debugPrint("STARTED LOADING");
      isLoading = true.obs;
      final resp = await _database.build();
      debugPrint("iINIT DB");
      _productManager = resp.obs;

      isLoading = false.obs;
    } catch (e) {
      isLoading.value = false;

      error = e.toString().obs;

      debugPrint(error.value);
    }
    update();
  }

  void setProduct(Products product) {
    setCostPrice(product.costPrice.toString());
    setDescription(product.description);
    setTitle(product.title);
    setImageUrl(product.imageUrl);
    setQuantity(product.quantity.toString());
  }

  void getProducts() async {
    try {
      _productManager?.value.productDao.findAllProducts().forEach((element) {
        products = element.obs;
      });
    } catch (e) {
      isLoading = false.obs;

      error = e.toString().obs;
    }
    update();
  }

  Future<bool> deleteProduct(Products product) async {
    try {
      isLoading = true.obs;

      await _productManager?.value.productDao.deleteProduct(product);

      isLoading = false.obs;
      update();
      return true;
    } catch (e) {
      isLoading = false.obs;

      error = e.toString().obs;
    }
    update();
    return false;
  }

  Future<bool> insertProduct(Products product) async {
    try {
      isLoading = true.obs;
      await _productManager?.value.productDao.insertProduct(product);
      isLoading = false.obs;
      update();
      return true;
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
    }
    update();
    return false;
  }

  Future<bool> updateProduct(Products product) async {
    try {
      isLoading = true.obs;
      await _productManager?.value.productDao.updateProduct(product);
      isLoading = false.obs;
      update();
      return true;
    } catch (e) {
      isLoading = false.obs;
      error = e.toString().obs;
    }
    update();
    return false;
  }

  void setTitle(String entry) {
    title = entry.obs;
  }

  void setDescription(String entry) {
    description = entry.obs;
  }

  void setCostPrice(String entry) {
    costPrice = (double.tryParse(entry) ?? 0.0).obs;
  }

  void setSellingPrice(String entry) {
    sellingPrice = (double.tryParse(entry) ?? 0.0).obs;
  }

  void setQuantity(String entry) {
    qaunttity = (int.tryParse(entry) ?? 0).obs;
  }

  void setTempImage(Uint8List entry) {
    tempImage = entry.obs;
  }

  void resetTempImage() => tempImage = null;

  void setImageUrl(String entry) {
    imageUrl = entry.obs;
    // update();
  }
}
