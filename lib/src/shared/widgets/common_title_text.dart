import 'package:flutter/material.dart';

class CommonTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const CommonTitleText({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.fontColor = Colors.black,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: fontColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
