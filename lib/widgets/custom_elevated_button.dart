import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback function;
  final String text;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final Widget? beginIcon;
  final Widget? endIcon;
  final Color borderColor;
  final double? horizontalPadding;
  const CustomElevatedButton({
    super.key,
    required this.function,
    required this.text,
    this.backgroundColor,
    required this.textStyle,
    this.beginIcon,
    this.borderColor = AppColors.accentYellow,
    this.endIcon,
    this.horizontalPadding,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:horizontalPadding??0 ),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            beginIcon == null ? SizedBox() : beginIcon!,
            Text(text, style: textStyle),
            endIcon == null ? SizedBox() : endIcon!,
          ],
        ),
      ),
    );
  }
}
