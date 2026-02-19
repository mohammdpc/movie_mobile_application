import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/core/utils/app_assets.dart';

import '../core/utils/app_styles.dart';

import '../widgets/lang_switcher.dart';
import '../widgets/link_text.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:movie/lang/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otherPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr('register'))),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
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
                  validator:
                      (v) =>
                          v == null || v.isEmpty
                              ? context.tr(LocaleKeys.nameIsRequired)
                              : null,
                  controller: nameController,
                ),
            
                SizedBox(height: heightOf(24, context)),
            
                CustomTextField(
                  prefixIcon: AppAssets.email,
                  hintText: context.tr(LocaleKeys.email),
                  validator: (v) {
                    RegExp checker = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (v == null || v.isEmpty) {
                      return context.tr(LocaleKeys.addEmail);
                    } else if (!checker.hasMatch(v)) {
                      return context.tr(LocaleKeys.invalidEmail);
                    }
                    return null;
                  },
                  controller: emailController,
                ),
            
                SizedBox(height: heightOf(24, context)),
            
                CustomTextField(
                  prefixIcon: AppAssets.password,
                  suffixIcon: AppAssets.eyeIcon,
                  obscure: true,
                  isPassword: true,
                  hintText: context.tr(LocaleKeys.password),
                  controller: passwordController,
                  validator: (v) {
                    if (v == null) {
                      return context.tr(LocaleKeys.passwordIsRequired);
                    } else if (v.length < 8) {
                      return context.tr(LocaleKeys.passwordTooShort);
                    }
                    return null;
                  },
                ),
            
                SizedBox(height: heightOf(24, context)),
            
                CustomTextField(
                  prefixIcon: AppAssets.password,
                  suffixIcon: AppAssets.eyeIcon,
                  obscure: true,
                  isPassword: true,
                  hintText: context.tr(LocaleKeys.confirmPassword),
                  controller: otherPasswordController,
                  validator: (v) {
                    if (v == null || v != passwordController.text) {
                      return context.tr(LocaleKeys.passwordIsRequired);
                    }
                    return null;
                  },
                ),
            
                SizedBox(height: heightOf(24, context)),
            
                CustomTextField(
                  prefixIcon: AppAssets.phone,
                  hintText: context.tr(LocaleKeys.phoneNumber),
                  controller: phoneController,
                  validator:
                      (v) =>
                          v == null || v.isEmpty
                              ? context.tr(LocaleKeys.emptyPhoneNumber)
                              : (v.length < 10
                                  ? context.tr(LocaleKeys.phoneNumberIsTooShort)
                                  : null),
                ),
            
                SizedBox(height: heightOf(24, context)),
            
                CustomElevatedButton(
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      //todo
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
