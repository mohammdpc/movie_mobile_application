import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/authentication/reset_password/reset_password.dart';

import 'package:movie/home/main_page.dart';
import 'package:movie/home/update_profile_page/update_profile_page.dart';
import 'package:movie/on_boarding/onboarding_screen.dart';
import 'authentication/Register/register_screen.dart';
import 'authentication/cubit/auth_view_model.dart';
import 'authentication/login_screen/login_screen.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_block_observer.dart';
import 'firebase_options.dart';
import 'lang/codegen_loader.g.dart';
//reset the branch
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routes: {
          AppRoutes.loginScreen:(context)=>LoginScreen(),
          AppRoutes.updateProfileScreen: (context) => UpdateProfilePage(),
          AppRoutes.registerScreen:(context) => RegisterScreen(),
          AppRoutes.onBoardingScreen:(context) => OnboardingScreen(),
          AppRoutes.resetPasswordScreen:(context) => ResetPassword(),
          AppRoutes.mainScreen:(context) => MainPage(),
        } ,
        initialRoute: AppRoutes.loginScreen,
      ),
    );
  }
}
