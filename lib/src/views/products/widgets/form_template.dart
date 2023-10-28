import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../entity/product.dart';
import '../../../misc/enums.dart';
import '../../../view_model/product_controller.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_image_picker_bottosheet.dart';
import '../../../widgets/app_snackbar.dart';
import '../../../widgets/app_text.dart';

class AppFormTemplate extends StatelessWidget {
  const AppFormTemplate(
      {super.key,
      required this.formKey,
      required this.products,
      required this.ctrl,
      this.formType = FormType.update});

  final GlobalKey<FormState> formKey;
  final Products products;
  final ProductController ctrl;
  final FormType formType;

  @override
  Widget build(BuildContext context) {
    ctrl.setProduct(products);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.11,
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 200,
      width: 200,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.markazi(
                    text: formType == FormType.add
                        ? 'Add product'
                        : 'Update Product',
                    fontSize: 28,
                  ),
                  const CloseButton()
                ],
              ),
              Gap(24.h),
              TextFormField(
                initialValue: formType == FormType.add ? null : products.title,
                decoration: const InputDecoration(hintText: 'Title'),
                onChanged: ctrl.setTitle,
                validator: (value) {
                  if (ctrl.title.value.isEmpty) {
                    return 'Product title cannot be empty';
                  }
                  if (ctrl.title.value.length > 30) {
                    return 'Product title cannot be be greater than 30 characters';
                  }
                  return null;
                },
              ),
              Gap(8.h),
              TextFormField(
                onChanged: ctrl.setDescription,
                initialValue:
                    formType == FormType.add ? null : products.description,
                decoration: const InputDecoration(hintText: 'Description'),
                validator: (value) {
                  if (ctrl.description.value.isEmpty) {
                    return 'Product description cannot be empty';
                  }
                  if (ctrl.description.value.length > 100) {
                    return 'Product description cannot be be greater than 100 characters';
                  }
                  return null;
                },
              ),
              Gap(8.h),
              TextFormField(
                onChanged: ctrl.setCostPrice,
                initialValue: formType == FormType.add
                    ? null
                    : products.costPrice.toInt().toString(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Cost price',
                ),
                validator: (value) {
                  if (ctrl.costPrice.value < 1) {
                    return 'Cost price cannot be less than 1';
                  }
                  if (ctrl.costPrice.value > ctrl.sellingPrice.value) {
                    return 'Cost price cannot be greater than selling price';
                  }
                  return null;
                },
              ),
              Gap(8.h),
              TextFormField(
                onChanged: ctrl.setSellingPrice,
                initialValue: formType == FormType.add
                    ? null
                    : products.sellingPrice.toInt().toString(),
                decoration: const InputDecoration(hintText: 'Selling price'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (ctrl.sellingPrice.value < 1) {
                    return 'Sellling price cannot be less than 1';
                  }
                  if (ctrl.costPrice.value > ctrl.sellingPrice.value) {
                    return 'Selling price cannot be less than cost price';
                  }
                  return null;
                },
              ),
              Gap(8.h),
              TextFormField(
                onChanged: ctrl.setQuantity,
                initialValue: formType == FormType.add
                    ? null
                    : products.quantity.toString(),
                decoration: const InputDecoration(hintText: 'Quantity'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.deny(RegExp(r"^0"))
                ],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (ctrl.qaunttity.value < 0) {
                    return 'Quantity cannot be less than 1';
                  }
                  if (ctrl.qaunttity.value > 1000) {
                    return 'Quantity cannot be more than 1000';
                  }
                  return null;
                },
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  formType == FormType.add
                      ? ctrl.tempImage?.value == null
                          ? const SizedBox.shrink()
                          : Image.memory(
                              ctrl.tempImage!.value,
                              height: 70,
                              width: 70,
                            )
                      : (products.imageUrl.isNotEmpty &&
                              ctrl.tempImage?.value == null
                          ? Image.file(
                              File(products.imageUrl),
                              height: 70,
                              width: 70,
                            )
                          : ctrl.tempImage?.value != null
                              ? Image.memory(
                                  ctrl.tempImage!.value,
                                  height: 70,
                                  width: 70,
                                )
                              : const SizedBox.shrink()),
                  GestureDetector(
                    onTap: () async {
                      final result = await showImagePickerBottomsheet(context);
                      if (result == null) return;
                      ctrl.setImageUrl(result);
                      final resultFile = File(result);
                      final inMemomry = await resultFile.readAsBytes();
                      ctrl.setTempImage(inMemomry);
                    },
                    child: const AppText(
                      text: 'Update Image',
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(16.h),
              AppButton(
                callback: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    formType == FormType.add
                        ? await addProduct(ctrl)
                        : await updateProductMethod();
                  } else {
                    return;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod() async {
    final resp = await ctrl.updateProduct(Products(
        id: products.id,
        title: ctrl.title.value,
        description: ctrl.description.value,
        costPrice: ctrl.costPrice.value,
        sellingPrice: ctrl.sellingPrice.value,
        createdAt: products.createdAt,
        updatedAt: DateTime.now().toIso8601String(),
        imageUrl: ctrl.imageUrl.value.isEmpty
            ? products.imageUrl
            : ctrl.imageUrl.value,
        quantity: ctrl.qaunttity.value));
    if (resp) {
      Get.back();
      appSnackBar(message: 'Product updated successfully!');
      ctrl.resetTempImage();
    } else {
      Get.back();
      appSnackBar(
          alertType: AlertType.error,
          message:
              'An error was encountered while updating the product. Please try again');
    }
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
