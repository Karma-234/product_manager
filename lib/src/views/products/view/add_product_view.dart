import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../widgets/app_text.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText.markazi(
              text: 'Add Product',
              fontSize: 28,
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
              decoration: const InputDecoration(hintText: 'Cost price'),
            ),
            Gap(8.h),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Selling price'),
            ),
            Gap(8.h),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Quantity'),
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
