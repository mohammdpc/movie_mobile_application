import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/home/update_profile_page/update_profile_page.dart';
import 'Register/register_screen.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'lang/codegen_loader.g.dart';

import 'package:movie/home/update_profile_page/update_profile_page.dart';
import 'package:movie/Register/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfilePage(),
        AppRoutes.registerScreen:(context) => RegisterScreen(),
      } ,
      initialRoute: AppRoutes.registerScreen,
    );
  }
}
