import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';
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

import 'register_logic.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController otherPasswordController;
  late final TextEditingController phoneController;
  String? emailError;
  String? passwordError;
  String? error;

  late final CarouselController avatarController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    otherPasswordController = TextEditingController();
    phoneController = TextEditingController();
    avatarController = CarouselController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otherPasswordController.dispose();
    phoneController.dispose();
    avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.register))),
      body: Form(
        key: _formKey,
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
                  validator: (v) => emailError ?? v.emailValidation(context),
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
                  validator:
                      (v) => passwordError ?? v.passwordValidation(context),
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
                    if (_formKey.currentState!.validate()) {
                      //todo
                      Map<String, String?> validation = await register(
                        context: context,
                        emailAddress: emailController.text,
                        password: passwordController.text,
                        userName: nameController.text,
                        phone: phoneController.text,
                        avatar: avatarController.initialItem,
                      );
                      emailError = validation['email'];
                      passwordError = validation['password'];
                      error = validation['error'];
                      if (error != null && error!.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error!,style: AppStyles.regular15White,),
                            backgroundColor: AppColors.darkGray,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                            ),
                          ),
                        );
                      } else if (_formKey.currentState!.validate()) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.updateProfileScreen);
                      }
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
                        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
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
    );
  }
}
