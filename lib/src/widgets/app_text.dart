import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextStyle? style;
  const AppText({
    super.key,
    this.text = 'This is product title',
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.style,
  });
  factory AppText.markazi({
    String text = '',
    double fontSize = 24,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) =>
      AppText(
        text: text,
        style: GoogleFonts.markaziText(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            textStyle: TextStyle(overflow: overflow)),
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.karla(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            textStyle: TextStyle(overflow: overflow),
          ),
    );
  }
}

class CustomTextSpan extends StatelessWidget {
  final String titleText;
  final String detailText;
  const CustomTextSpan({
    super.key,
    this.titleText = 'Cost price:',
    this.detailText = '\$1.99',
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$titleText ',
        children: [
          TextSpan(
            text: detailText,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
      style: GoogleFonts.karla(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
