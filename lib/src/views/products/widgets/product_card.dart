import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../widgets/app_text.dart';

class ProductCard extends StatelessWidget {
  final String productTitle;
  final String productDescription;
  final String costPrice;
  final String sellingPrice;

  const ProductCard({
    super.key,
    this.productTitle = 'This is product title',
    this.productDescription = 'This is product description',
    this.costPrice = '\$1.99',
    this.sellingPrice = '\$2.99',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              '',
              errorBuilder: (context, error, stackTrace) => Container(
                  height: 150.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(Icons.av_timer_sharp)),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                  const CircularProgressIndicator.adaptive(),
            ),
          ),
          Gap(8.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText.markazi(
                      text: productTitle,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: productDescription,
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextSpan(
                          detailText: costPrice,
                        ),
                        Gap(3.h),
                        CustomTextSpan(
                          titleText: 'Selling price:',
                          detailText: sellingPrice,
                        ),
                        Gap(3.h),
                        const CustomTextSpan(
                          titleText: 'Quantity:',
                          detailText: '700',
                        ),
                      ],
                    ),
                    PopupMenuButton(
                      position: PopupMenuPosition.under,
                      tooltip: 'More',
                      itemBuilder: (context) => ['Delete', 'Update']
                          .map(
                            (e) => PopupMenuItem(
                              child: AppText(
                                text: e,
                                fontSize: 14,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
