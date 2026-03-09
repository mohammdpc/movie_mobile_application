import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/authentication/login_screen/login_navigator.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

import '../../core/utils/app_utils.dart';
import '../../core/utils/dialog_utils.dart';
import '../../widgets/lang_switcher.dart';
import '../cubit/auth_state.dart';
import '../cubit/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator{
  late AuthViewModel viewModel ;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<AuthViewModel>();
    viewModel.loginNavigator = this;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<AuthViewModel, AuthState>(
      listener: (context, state) {},
      child:       Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.02,
              ),
              child: Form(
                key: viewModel.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: context.height * 0.025,
                  children: [
                    SizedBox(height: height * 0.02),
                    Center(child: Image.asset(AppAssets.logoMovie)),
                    CustomTextField(
                      controller: emailController,
                      validator: (email)=>email.emailValidation(context),
                      borderRadius: 16,
                      prefixIcon: Icon(Icons.email, color: AppColors.white),
                      hintText: 'email'.tr(),
                      hintStyleDark: Theme.of(context).textTheme.titleLarge,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      validator: (password)=>password.passwordValidation(context),
                      isPassword: true,
                      obscure: true,
                      borderRadius: 16,
                      prefixIcon: Icon(Icons.lock, color: AppColors.white),
                      hintText: 'password'.tr(),
                      hintStyleDark: Theme.of(context).textTheme.titleLarge,
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.only(bottom: context.height * 0.01),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.resetPasswordScreen);
                      },
                      child: Text(
                        'forget_password_question'.tr(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.accentYellow,
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      function: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (viewModel.loginFormKey.currentState!.validate()) {
                          await viewModel.loginAuth(emailController.text,passwordController.text);                        }
                      },
                      text: 'login'.tr(),
                      textStyle: AppStyles.regular20Black,

                      backgroundColor: AppColors.accentYellow,
                    ),
                    Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont_have_account'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                          },
                          child: Text(
                            'create_one'.tr(),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.accentYellow),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.accentYellow,
                            indent: 30,
                            endIndent: 30,
                          ),
                        ),
                        Text(
                          'or'.tr(),
                          style: AppStyles.regular15AccentYellow,
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.accentYellow,
                            indent: 30,
                            endIndent: 30,
                          ),
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      function: () async {
                        await viewModel.signInWithGoogle();
                      },
                      icon: SvgPicture.asset(AppAssets.googleIcon),
                      text: 'login_with_google'.tr(),
                      textStyle: AppStyles.regular20Black,

                      backgroundColor: AppColors.accentYellow,
                    ),

                    SizedBox(height: heightOf(18.25, context)),
                    Center(child: LangSwitcher()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void showError({required String message}) {
    // TODO: implement showError
    DialogUtils.showMessage(
      title: "Error",
      customColor: AppColors.red,
      context: context,
      message: message,
      posActionName: "ok",
    );
  }

  @override
  void showMyLoading() {
    // TODO: implement showMyLoading
    DialogUtils.showLoading(
      context: context,
      loadingMessage: "Loading...",
      textStyle: AppStyles.regular20White,
    );
  }

  @override
  void showSuccess({required String message}) {
    // TODO: implement showSuccess
    DialogUtils.showMessage(
        title: "Success",
        customColor: AppColors.green,
        context: context,
        dismissible: false,
        message:message,
        posActionName: "Ok",
        posAction: () {Navigator.of(context,).pushReplacementNamed(AppRoutes.mainScreen);
        }
    );
  }

  @override
  void hideDialog() {
    // TODO: implement hideDialog
    DialogUtils.hideDialog(context: context);
  }
}
