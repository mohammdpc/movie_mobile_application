import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: AppColors.transparentColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.accentYellow,
      )
    ),
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.dark(
      primary: AppColors.accentYellow,
      secondary: AppColors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGray,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.accentYellow,
    ),
    textTheme: TextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        foregroundColor: AppColors.darkGray,
        backgroundColor: AppColors.accentYellow,
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    ),
  );
}
