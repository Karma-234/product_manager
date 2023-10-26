import 'package:flutter/material.dart';
import 'package:product_manager/src/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? callback;
  final String text;
  const AppButton({
    super.key,
    this.height = 45,
    this.width,
    this.callback,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    this.text = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: buttonColor,
        ),
        child: Center(
          child: AppText.markazi(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: textColor,
            text: text,
          ),
        ),
      ),
    );
  }
}
