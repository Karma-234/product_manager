import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/src/entity/product.dart';
import 'package:product_manager/src/view_model/product_controller.dart';
import 'package:product_manager/src/views/products/widgets/form_template.dart';

import 'package:uuid/uuid.dart';

import '../../../misc/enums.dart';
import '../../../widgets/app_snackbar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = ProductController.controller;
    final formKey = GlobalKey<FormState>();
    final product = Products(
        costPrice: 1,
        sellingPrice: 1,
        id: '1',
        quantity: 1,
        title: '',
        createdAt: '',
        updatedAt: '',
        imageUrl: '',
        description: '');
    return Material(
      color: Colors.black.withOpacity(0),
      child: AppFormTemplate(
        formKey: formKey,
        products: product,
        ctrl: ctrl,
        formType: FormType.add,
      ),
    );
  }

  Future<void> addProduct(ProductController ctrl) async {
    final resp = await ctrl.insertProduct(Products(
        id: const Uuid().v4(),
        title: ctrl.title.value,
        description: ctrl.description.value,
        costPrice: ctrl.costPrice.value,
        sellingPrice: ctrl.sellingPrice.value,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        imageUrl: ctrl.imageUrl.value,
        quantity: ctrl.qaunttity.value));
    if (resp) {
      Get.back();
      appSnackBar(message: 'Product added successfully!');
      ctrl.resetTempImage();
    } else {
      Get.back();
      appSnackBar(
          alertType: AlertType.error,
          message:
              'An error was encountered while adding the product. Please try again');
    }
  }
}
