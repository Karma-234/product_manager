// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:product_manager/src/entity/product.dart';
// import 'package:product_manager/src/view_model/product_controller.dart';
// import 'package:product_manager/src/widgets/app_button.dart';

// import '../../../misc/enums.dart';
// import '../../../widgets/app_image_picker_bottosheet.dart';
// import '../../../widgets/app_snackbar.dart';
// import '../../../widgets/app_text.dart';

// class UpdateProductView extends StatelessWidget {
//   final Products products;
//   const UpdateProductView({super.key, required this.products});
//   static final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = ProductController.controller;
//     // ctrl.setProduct(products);

//     return GetBuilder<ProductController>(builder: (controller) {
//       return Material(
//         color: Colors.black.withOpacity(0),
//         child: Container(
//           margin: EdgeInsets.symmetric(
//               vertical: MediaQuery.sizeOf(context).height * 0.11,
//               horizontal: MediaQuery.sizeOf(context).width * 0.1),
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           height: 200,
//           width: 200,
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       AppText.markazi(
//                         text: 'Update Product',
//                         fontSize: 28,
//                       ),
//                       const CloseButton()
//                     ],
//                   ),
//                   Gap(24.h),
//                   TextFormField(
//                     initialValue: products.title,
//                     onChanged: ctrl.setTitle,
//                     decoration: const InputDecoration(hintText: 'Title'),
//                     validator: (value) {
//                       if (ctrl.title.value.isEmpty) {
//                         return 'Product title cannot be empty';
//                       }
//                       if (ctrl.title.value.length > 30) {
//                         return 'Product title cannot be be greater than 30 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   Gap(8.h),
//                   TextFormField(
//                     initialValue: products.description,
//                     onChanged: ctrl.setDescription,
//                     decoration: const InputDecoration(hintText: 'Description'),
//                     validator: (value) {
//                       if (ctrl.description.value.isEmpty) {
//                         return 'Product description cannot be empty';
//                       }
//                       if (ctrl.description.value.length > 100) {
//                         return 'Product description cannot be be greater than 100 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   Gap(8.h),
//                   TextFormField(
//                     onChanged: ctrl.setCostPrice,
//                     initialValue: products.costPrice.toInt().toString(),
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       hintText: 'Cost price',
//                     ),
//                     validator: (value) {
//                       if (ctrl.costPrice.value < 1) {
//                         return 'Cost price cannot be less than 1';
//                       }
//                       if (ctrl.costPrice.value > ctrl.sellingPrice.value) {
//                         return 'Cost price cannot be greater than selling price';
//                       }
//                       return null;
//                     },
//                   ),
//                   Gap(8.h),
//                   TextFormField(
//                     onChanged: ctrl.setSellingPrice,
//                     initialValue: products.sellingPrice.toInt().toString(),
//                     decoration:
//                         const InputDecoration(hintText: 'Selling price'),
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (ctrl.sellingPrice.value < 1) {
//                         return 'Sellling price cannot be less than 1';
//                       }
//                       if (ctrl.costPrice.value > ctrl.sellingPrice.value) {
//                         return 'Selling price cannot be less than cost price';
//                       }
//                       return null;
//                     },
//                   ),
//                   Gap(8.h),
//                   TextFormField(
//                     onChanged: ctrl.setQuantity,
//                     initialValue: products.quantity.toString(),
//                     decoration: const InputDecoration(hintText: 'Quantity'),
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(6),
//                       FilteringTextInputFormatter.deny(RegExp(r"^0"))
//                     ],
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (ctrl.qaunttity.value < 0) {
//                         return 'Quantity cannot be less than 1';
//                       }
//                       if (ctrl.qaunttity.value > 1000) {
//                         return 'Quantity cannot be more than 1000';
//                       }
//                       return null;
//                     },
//                   ),
//                   Gap(8.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       products.imageUrl.isNotEmpty &&
//                               ctrl.tempImage?.value == null
//                           ? Image.file(
//                               File(products.imageUrl),
//                               height: 70,
//                               width: 70,
//                             )
//                           : ctrl.tempImage?.value != null
//                               ? Image.memory(
//                                   ctrl.tempImage!.value,
//                                   height: 70,
//                                   width: 70,
//                                 )
//                               : const SizedBox.shrink(),
//                       GestureDetector(
//                         onTap: () async {
//                           final result =
//                               await showImagePickerBottomsheet(context);
//                           if (result == null) return;
//                           ctrl.setImageUrl(result);
//                           final resultFile = File(result);
//                           final inMemomry = await resultFile.readAsBytes();
//                           ctrl.setTempImage(inMemomry);
//                         },
//                         child: const AppText(
//                           text: 'Update Image',
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Gap(16.h),
//                   AppButton(
//                     callback: () async {
//                       if (formKey.currentState?.validate() ?? false) {
//                         final resp = await ctrl.updateProduct(Products(
//                             id: products.id,
//                             title: ctrl.title.value,
//                             description: ctrl.description.value,
//                             costPrice: ctrl.costPrice.value,
//                             sellingPrice: ctrl.sellingPrice.value,
//                             createdAt: products.createdAt,
//                             updatedAt: DateTime.now().toIso8601String(),
//                             imageUrl: ctrl.imageUrl.value.isEmpty
//                                 ? products.imageUrl
//                                 : ctrl.imageUrl.value,
//                             quantity: ctrl.qaunttity.value));
//                         if (resp) {
//                           Get.back();
//                           appSnackBar(message: 'Product updated successfully!');
//                           ctrl.resetTempImage();
//                           ctrl
//                               .initDatabase()
//                               .then((value) => ctrl.getProducts());
//                         } else {
//                           Get.back();
//                           appSnackBar(
//                               alertType: AlertType.error,
//                               message:
//                                   'An error was encountered while updating the product. Please try again');
//                         }
//                       } else {
//                         return;
//                       }
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
