import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';

class DeleteProductPrompt extends StatelessWidget {
  final VoidCallback onDelete;
  const DeleteProductPrompt({
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText.markazi(
            text: 'Delete?',
            fontSize: 28,
            color: Colors.red[800]!,
            fontWeight: FontWeight.w900,
            align: TextAlign.center,
          ),
          Gap(16.h),
          const AppText(
            alignment: TextAlign.center,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.w500,
            text:
                'Are you sure you want to delete this item? You will permanently lose access to this record!',
          ),
          Gap(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppButton(
                  text: 'Yes, Proceed.',
                  buttonColor: Colors.red,
                  textColor: Colors.white,
                  callback: () {
                    onDelete();
                  },
                ),
              ),
              Gap(8.w),
              Flexible(
                child: AppButton(
                  text: 'No, exit',
                  callback: () => Get.back(closeOverlays: true),
                ),
              ),
            ],
          ),
          Gap(40.h),
        ],
      ),
    );
  }
}
