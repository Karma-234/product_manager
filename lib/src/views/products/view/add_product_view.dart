import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:product_manager/src/widgets/app_button.dart';
import 'package:product_manager/src/widgets/app_image_picker_bottosheet.dart';

import '../../../widgets/app_text.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0),
      child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.markazi(
                    text: 'Add Product',
                    fontSize: 28,
                  ),
                  const CloseButton()
                ],
              ),
              Gap(24.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              Gap(8.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              Gap(8.h),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Cost price',
                ),
              ),
              Gap(8.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Selling price'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
              ),
              Gap(8.h),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Quantity'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.deny(RegExp(r"^0"))
                ],
                keyboardType: TextInputType.number,
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const SizedBox.shrink(),
                  bytes == null
                      ? const SizedBox.shrink()
                      : Image.memory(
                          bytes!,
                          height: 70,
                          width: 70,
                        ),
                  GestureDetector(
                    onTap: () async {
                      final result = await showImagePickerBottomsheet(context);
                      if (result == null) return;
                      final resultFile = File(result);
                      final inMemomry = await resultFile.readAsBytes();
                      setState(() {
                        bytes = inMemomry;
                      });
                      // debugPrint(resultFile);
                    },
                    child: const AppText(
                      text: 'Add Image',
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(16.h),
              const AppButton()
            ],
          ),
        ),
      ),
    );
  }
}
