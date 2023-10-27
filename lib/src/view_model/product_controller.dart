import 'package:get/get.dart';
import 'package:product_manager/src/data/product_manager.dart';
import 'package:product_manager/src/entity/product.dart';

class ProductController extends GetxController {
  static ProductController get controller => Get.find();
  final _database = $FlatProductManager.databaseBuilder('product_manager.db');
  ProductManager? _productManager;
  RxString error = ''.obs;
  RxBool isLoading = false.obs;
  RxList<Products>? _products;
  RxList<Products> get product => _products ?? <Products>[].obs;
  Rx<Stream<List<Products>>>? get allProducts =>
      _productManager?.productDao.findAllProducts().obs;

  Future<void> initDatabase() async {
    try {
      isLoading.value = true;
      _productManager = await _database.build();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  List products = [].obs;

  void setProducts() async {
    try {
      allProducts?.value.forEach((e) {
        _products = [...e].obs;
      });
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<void> deleteProduct(Products product) async {
    try {
      isLoading.value = true;
      await _productManager?.productDao.deleteProduct(product);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }

  Future<void> insertProduct(Products product) async {
    try {
      isLoading.value = true;
      await _productManager?.productDao.insertProduct(product);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
