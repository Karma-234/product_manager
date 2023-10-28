import 'package:flutter/material.dart';
import 'package:product_manager/src/entity/product.dart';
import 'package:product_manager/src/misc/enums.dart';
import 'package:product_manager/src/view_model/product_controller.dart';

import '../widgets/form_template.dart';

class UpdateProductView extends StatelessWidget {
  final Products products;
  const UpdateProductView({super.key, required this.products});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ctrl = ProductController.controller;

    return Material(
      color: Colors.black.withOpacity(0),
      child: AppFormTemplate(
        formKey: formKey,
        products: products,
        ctrl: ctrl,
        formType: FormType.update,
      ),
    );
  }
}
