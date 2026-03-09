import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/authentication/Register/register_navigator.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/widgets/lang_switcher.dart';
import 'package:movie/widgets/link_text.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movie/lang/locale_keys.g.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/dialog_utils.dart';
import '../cubit/auth_state.dart';
import '../cubit/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator{
  late AuthViewModel viewModel ;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController otherPasswordController;
  late final TextEditingController phoneController;
  int avatarIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<AuthViewModel>();
    viewModel.registerNavigator = this;
  }
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    otherPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otherPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(title: Text(context.tr(LocaleKeys.register))),
        body: Form(
          key: viewModel.registerFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: 9,
                    itemBuilder:
                        (context, index, i) => Container(
                          height: heightOf(161, context),
                          width: widthOf(158, context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssets.avatarList[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    options: CarouselOptions(
                      height: heightOf(161, context),
                      viewportFraction: .33,
                      enlargeCenterPage: true,
                      enlargeFactor: .5,
                      onPageChanged: (index, reason) {
                        setState(() {
                          avatarIndex = index;
                        });
                      },
                    ),
                  ),

                  Text(context.tr(LocaleKeys.avatar)),
                  SizedBox(height: heightOf(12, context)),

                  CustomTextField(
                    prefixIcon: AppAssets.identification,
                    hintText: context.tr(LocaleKeys.name),
                    verticalPadding: heightOf(11, context),
                    validator: (v) => v.userNameValidation(context),
                    controller: nameController,
                  ),

                  SizedBox(height: heightOf(24, context)),

                  CustomTextField(
                    prefixIcon: AppAssets.email,
                    hintText: context.tr(LocaleKeys.email),
                    verticalPadding: heightOf(11, context),
                    validator: (v) => v.emailValidation(context),
                    controller: emailController,
                  ),

                  SizedBox(height: heightOf(24, context)),

                  CustomTextField(
                    prefixIcon: AppAssets.password,
                    suffixIcon: AppAssets.eyeIcon,
                    verticalPadding: heightOf(11, context),
                    obscure: true,
                    isPassword: true,
                    hintText: context.tr(LocaleKeys.password),
                    controller: passwordController,
                    validator: (v) => v.passwordValidation(context),
                  ),

                  SizedBox(height: heightOf(24, context)),

                  CustomTextField(
                    prefixIcon: AppAssets.password,
                    suffixIcon: AppAssets.eyeIcon,
                    verticalPadding: heightOf(11, context),
                    obscure: true,
                    isPassword: true,
                    hintText: context.tr(LocaleKeys.confirmPassword),
                    controller: otherPasswordController,
                    validator:
                        (v) => v.passwordValidation(
                          context,
                          passwordController.text,
                          true,
                        ),
                  ),

                  SizedBox(height: heightOf(24, context)),

                  CustomTextField(
                    prefixIcon: AppAssets.phone,
                    hintText: context.tr(LocaleKeys.phoneNumber),
                    verticalPadding: heightOf(11, context),
                    controller: phoneController,
                    validator: (v) => v.phoneValidation(context),
                  ),

                  SizedBox(height: heightOf(24, context)),

                  CustomElevatedButton(
                    function: () async {
                      if (viewModel.registerFormKey.currentState!.validate()) {
                        //todo
                        await viewModel.registerAuth(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          phoneController.text,
                          avatarIndex + 1,
                        );
                      }
                    },
                    text: context.tr(LocaleKeys.createAccount),
                    textStyle: AppStyles.regular20Black,
                  ),

                  SizedBox(height: heightOf(17.67, context)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.tr(LocaleKeys.alreadyHasAnAccount)),
                      LinkText(
                        text: context.tr(LocaleKeys.login),
                        action: () {
                          /*todo*/
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginScreen);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: heightOf(18.25, context)),

                  LangSwitcher(),
                ],
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
