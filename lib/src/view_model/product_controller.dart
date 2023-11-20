import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:product_manager/src/data/sqf_product_manager.dart';
import 'package:product_manager/src/domain/payload/product_payload.dart';

class ProductController extends GetxController {
  static ProductController get controller => Get.find();

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
  RxList<Product> products = <Product>[].obs;

  void setProduct(Product product, {bool shouldUpdate = true}) {
    setCostPrice(product.cost_price?.toInt().toString() ?? 'Not specified',
        shouldUpdate: shouldUpdate);
    setSellingPrice(
        product.selling_price?.toInt().toString() ?? 'Not sepcified',
        shouldUpdate: shouldUpdate);
    setDescription(product.description.toString(), shouldUpdate: shouldUpdate);
    setTitle(product.name.toString(), shouldUpdate: shouldUpdate);
    setImageUrl(product.imageUrl.toString(), shouldUpdate: shouldUpdate);
    setQuantity(product.quantity.toString(), shouldUpdate: shouldUpdate);
  }

  void resetFields({bool shouldUpdate = true}) {
    setCostPrice('', shouldUpdate: shouldUpdate);
    setSellingPrice('', shouldUpdate: shouldUpdate);
    setDescription('', shouldUpdate: shouldUpdate);
    setTitle('', shouldUpdate: shouldUpdate);
    setImageUrl('', shouldUpdate: shouldUpdate);
    setQuantity('', shouldUpdate: shouldUpdate);
  }

  void getProducts() async {
    try {
      isLoading = true.obs;
      final resp = await Product().select().toList();
      products = resp.obs;
      isLoading = false.obs;
    } catch (e) {
      isLoading = false.obs;

      error = e.toString().obs;
    }
    update();
  }

  Future<bool> deleteProduct(int id) async {
    try {
      isLoading = true.obs;
      await Product().select().id.equals(id).delete();
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

  Future<bool> insertProduct(ProductPayload product) async {
    try {
      isLoading = true.obs;
      await Product.withFields(
              null,
              product.name,
              product.decription,
              product.costPrice,
              product.sellingPrice,
              product.quantity,
              product.imageUrl,
              DateTime.now(),
              DateTime.now(),
              null)
          .save();
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

  Future<bool> updateProduct(ProductPayload product, {required int id}) async {
    try {
      isLoading = true.obs;
      await Product(
        id: id,
        name: product.name,
        description: product.decription,
        imageUrl: product.imageUrl,
        quantity: product.quantity,
        updated_at: DateTime.now(),
        selling_price: product.sellingPrice,
        cost_price: product.costPrice,
      ).save();
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

  void setTitle(String entry, {bool shouldUpdate = true}) {
    title = entry.obs;
    if (shouldUpdate) update();
  }

  void setDescription(String entry, {bool shouldUpdate = true}) {
    description = entry.obs;
    if (shouldUpdate) update();
  }

  void setCostPrice(String entry, {bool shouldUpdate = true}) {
    costPrice = (double.tryParse(entry) ?? 0.0).obs;
    if (shouldUpdate) update();
  }

  void setSellingPrice(String entry, {bool shouldUpdate = true}) {
    sellingPrice = (double.tryParse(entry) ?? 0.0).obs;
    if (shouldUpdate) update();
  }

  void setQuantity(String entry, {bool shouldUpdate = true}) {
    qaunttity = (int.tryParse(entry) ?? 0).obs;
    if (shouldUpdate) update();
  }

  void setTempImage(Uint8List entry, {bool shouldUpdate = true}) {
    tempImage = entry.obs;
    if (shouldUpdate) update();
  }

  void resetTempImage({bool shouldUpdate = true}) {
    tempImage = null;
    if (shouldUpdate) update();
  }

  void setImageUrl(String entry, {bool shouldUpdate = true}) {
    imageUrl = entry.obs;
    if (shouldUpdate) update();
  }
}
