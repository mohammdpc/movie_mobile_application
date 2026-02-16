import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback function;
  String text;
  Color? backgroundColor;
  TextStyle textStyle;
  Widget? icon;
  Color borderColor;
  CustomElevatedButton({
    super.key,
    required this.function,
    required this.text,
    this.backgroundColor,
    required this.textStyle,
    this.icon,
    this.borderColor = AppColors.accentYellow,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor == AppColors.transparentColor?AppColors.black:backgroundColor,
        side: BorderSide(
          color: borderColor,
          width: 2,
        ),
      ),
      onPressed: function,
      child: Row(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? SizedBox() : icon!,
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
