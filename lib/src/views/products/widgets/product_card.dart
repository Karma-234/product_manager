import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:product_manager/src/entity/product.dart';
import 'package:product_manager/src/view_model/product_controller.dart';
import 'package:product_manager/src/views/products/view/update_product_view.dart';

import '../../../widgets/app_text.dart';
import 'dlete_product_prompt.dart';

class ProductCard extends StatelessWidget {
  final Products _products;

  const ProductCard({super.key, 
    required Products products,
  }) : _products = products;

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
                      text: _products.title,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: _products.description,
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
                          detailText: _products.costPrice.toString(),
                        ),
                        Gap(3.h),
                        CustomTextSpan(
                          titleText: 'Selling price:',
                          detailText: _products.sellingPrice.toString(),
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
                      onSelected: (value) {},
                      itemBuilder: (context) => ['Update', 'Delete']
                          .map(
                            (e) => PopupMenuItem(
                              value: e,
                              onTap: () {
                                switch (e) {
                                  case 'Delete':
                                    showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      isDismissible: false,
                                      barrierColor:
                                          Colors.grey.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          topRight: Radius.circular(
                                            15.r,
                                          ),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return DeleteProductPrompt(
                                          onDelete: () => ProductController
                                              .controller
                                              .deleteProduct(_products),
                                        );
                                      },
                                    );
                                    return;
                                  case 'Update':
                                    showDialog(
                                      context: context,
                                      builder: (context) => UpdateProductView(
                                        products: _products,
                                      ),
                                    );
                                    return;
                                  default:
                                    debugPrint("Did nothing");
                                }
                              },
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
