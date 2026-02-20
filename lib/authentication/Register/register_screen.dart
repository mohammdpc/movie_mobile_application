import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.register))),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widthOf(16, context),
          ),
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
                  validator:
                      (v) =>
                          v.userNameValidation(context),
                  controller: nameController,
                ),

                SizedBox(height: heightOf(24, context)),

                CustomTextField(
                  prefixIcon: AppAssets.email,
                  hintText: context.tr(LocaleKeys.email),
                  verticalPadding: heightOf(11, context),
                  validator: (v) =>v.emailValidation(context),
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
                  validator: (v)=>v.passwordValidation(context),
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
                  validator: (v) =>v.passwordValidation(context,passwordController.text,true),
                ),

                SizedBox(height: heightOf(24, context)),

                CustomTextField(
                  prefixIcon: AppAssets.phone,
                  hintText: context.tr(LocaleKeys.phoneNumber),
                  verticalPadding: heightOf(11, context),
                  controller: phoneController,
                  validator:
                      (v) =>v.phoneValidation(context),
                ),

                SizedBox(height: heightOf(24, context)),

                CustomElevatedButton(
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      //todo
                      Navigator.of(context).pushNamed(AppRoutes.updateProfileScreen);
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
                        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
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
