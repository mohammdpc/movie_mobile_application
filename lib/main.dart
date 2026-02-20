import 'package:flutter/material.dart';
import 'package:movie/home/forget_password_page/forget_password_page.dart';
import 'package:movie/home/update_profile_page/update_profile_page.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfilePage(),
        AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordPage(),
      } ,
      initialRoute: AppRoutes.forgetPasswordScreen,
    );
  }
}

