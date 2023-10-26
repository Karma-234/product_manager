import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:product_manager/src/widgets/app_button.dart';

import '../../../widgets/app_text.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.15,
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
                    text: 'Update Product',
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
              Gap(16.h),
              const AppButton()
            ],
          ),
        ),
      ),
    );
  }
}
