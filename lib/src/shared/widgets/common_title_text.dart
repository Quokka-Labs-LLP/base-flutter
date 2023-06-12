import 'package:flutter/material.dart';

class CommonTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  const CommonTitleText({
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.fontColor = Colors.black,
    required this.text, Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
