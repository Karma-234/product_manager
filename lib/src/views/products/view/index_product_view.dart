import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:product_manager/src/views/products/view/add_product_view.dart';
import 'package:product_manager/src/views/products/widgets/empty_state_placeholder.dart';

import 'package:product_manager/src/widgets/app_text.dart';

import '../../../view_model/product_controller.dart';
import '../widgets/product_card.dart';

class IndexProductView extends StatefulWidget {
  const IndexProductView({super.key});

  @override
  State<IndexProductView> createState() => _IndexProductViewState();
}

class _IndexProductViewState extends State<IndexProductView> {
  final ctrl = Get.put(ProductController());
  @override
  void initState() {
    super.initState();
    if (mounted) {
      ctrl.getProducts();
    }
  }

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
      floatingActionButton: GestureDetector(
        onTap: () {
          ctrl.resetFields();
          showDialog(
            context: context,
            builder: (context) => const AddProductView(),
          );
        },
        child: Container(
          height: 50.h,
          width: 50.h,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: GetBuilder<ProductController>(
        builder: (productController) {
          return productController.isLoading.value
              ? const Center(child: CupertinoActivityIndicator())
              : productController.products.isEmpty
                  ? const EmptyStaePlaceHolder()
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      itemBuilder: (context, i) => Obx(() => ProductCard(
                            products: productController.products[i],
                          )),
                      separatorBuilder: (context, index) => Gap(16.h),
                      itemCount: productController.products.length);
        },
      ),
    );
  }
}
