import 'package:flutter/material.dart';
import '../core/utils/app_styles.dart';
class FilledTextButton extends StatelessWidget {
  final void Function() action;
  final String text;
  const FilledTextButton({super.key,required this.action, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: Center(
        child: Text(
          text,
          style: AppStyles.regular20Black,
        ),
      ),
    );
  }
}
