import 'package:flutter/material.dart';

import '../utilities/callback_methods.dart';

class CommonButton extends StatelessWidget {
  final VoidToVoidFunc onTap;
  final String btnText;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  const CommonButton(
      {required this.onTap,
      required this.btnText,
      super.key,
      this.fontSize = 20,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.w500,});

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
