import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:product_manager/src/widgets/app_text.dart';

import '../widgets/product_card.dart';

class IndexProductView extends StatelessWidget {
  const IndexProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        title: AppText.markazi(
          fontSize: 34,
          color: Colors.white,
          text: 'Dashboard',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemBuilder: (context, index) => const ProductCard(),
          separatorBuilder: (context, index) => Gap(16.h),
          itemCount: 10),
    );
  }
}
