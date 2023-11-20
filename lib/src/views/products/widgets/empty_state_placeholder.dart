import 'package:flutter/widgets.dart';
import 'package:product_manager/src/widgets/app_text.dart';

class EmptyStaePlaceHolder extends StatelessWidget {
  const EmptyStaePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText.markazi(
        text: 'No products in inventory!',
      ),
    );
  }
}
