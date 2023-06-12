import 'package:base_architecture/src/shared/utilities/callback_methods.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidToVoidFunc onTap;
  final String btnText;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  const CommonButton({Key? key,
    required this.onTap,
    required this.btnText,
    this.fontSize = 20,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w500}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
