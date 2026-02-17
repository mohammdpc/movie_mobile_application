import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'lang/codegen_loader.g.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
//screens
import 'package:movie/Register/register_screen.dart';
import 'package:movie/home/update_profile_page/update_profile_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ar', 'EG'),
    ],
    useOnlyLangCode: true,
    assetLoader: CodegenLoader(),
    //fallbackLocale: Locale('en', 'US'),
    path: 'assets/translations',
    saveLocale: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      routes: {
        AppRoutes.updateProfileScreen: (context) => UpdateProfilePage(),
        AppRoutes.registerScreen:(context) => RegisterScreen(),
      } ,
      initialRoute: AppRoutes.registerScreen,
    );
  }
}

