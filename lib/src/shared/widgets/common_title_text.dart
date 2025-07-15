import 'package:flutter/material.dart';

class CommonTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? fontColor;

  const CommonTitleText({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w500,
    this.fontColor,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      text,
      style:
      baseStyle?.copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: fontColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
