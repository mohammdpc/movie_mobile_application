import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMessage,
    Color? color,
    required TextStyle textStyle,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            spacing: 25,
            children: [
              CircularProgressIndicator(),
              Text(loadingMessage, style: textStyle),
            ],
          ),
          backgroundColor: AppColors.darkGray,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }

  static void hideDialog({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    Color? customColor,
    String title = "",
    String? posActionName,
    String? negActionName,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool dismissible = true,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (context) {
        TextStyle mainStyle = AppStyles.regular20White;
        List<Widget> actions = [];
        if (posActionName != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                posAction?.call();
              },
              child: Text(posActionName, style: mainStyle),
            ),
          );
        }
        if (negActionName != null) {
          actions.add(
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                negAction?.call();
              },
              child: Text(negActionName, style: mainStyle),
            ),
          );
        }
        return AlertDialog(
          content: Text(message, style: AppStyles.regular16White),
          title: Text(title, style: mainStyle.copyWith(color: customColor)),
          actions: actions,
          backgroundColor: AppColors.darkGray,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }
}
