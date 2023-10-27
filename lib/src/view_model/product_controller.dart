import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get controller => Get.find();
  List products = [].obs;

  void setProducts(List entry) {
    products = entry;
  }

  Future<void> getProducts() async {}
}
