import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/core/utils/app_assets.dart';

import '../reusable widgits/input_field.dart';
import '../reusable widgits/filled_text_button.dart';
import '../reusable widgits/lang_switcher.dart';
import '../reusable widgits/link_text.dart';

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

              InputField(
                iconPath: AppAssets.identification,
                hintText: context.tr(LocaleKeys.name),
                validator:
                    (v) =>
                        v == null || v.isEmpty
                            ? context.tr(LocaleKeys.nameIsRequired)
                            : null,
                controller: nameController,
              ),

              SizedBox(height: heightOf(24, context)),

              InputField(
                iconPath: AppAssets.email,
                hintText: context.tr(LocaleKeys.email),
                validator: (v) {
                  RegExp checker = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (v == null || v.isEmpty) {
                    return context.tr(LocaleKeys.addEmail);
                  } else if (!checker.hasMatch(v)) {
                    return context.tr(LocaleKeys.invalidEmail);
                  }
                },
                controller: emailController,
              ),

              SizedBox(height: heightOf(24, context)),

              InputField(
                iconPath: AppAssets.password,
                hintText: context.tr(LocaleKeys.password),
                validator: (v) {
                  if (v == null) {
                    return context.tr(LocaleKeys.passwordIsRequired);
                  } else if (v.length < 8) {
                    return context.tr(LocaleKeys.passwordTooShort);
                  }
                },
                controller: passwordController,
              ),

              SizedBox(height: heightOf(24, context)),

              InputField(
                iconPath: AppAssets.password,
                hintText: context.tr(LocaleKeys.confirmPassword),
                validator: (v) {
                  if (v == null || v != passwordController.text) {
                    return context.tr(LocaleKeys.passwordIsRequired);
                  }
                },
                controller: otherPasswordController,
              ),

              SizedBox(height: heightOf(24, context)),

              InputField(
                iconPath: AppAssets.phone,
                hintText: context.tr(LocaleKeys.phoneNumber),
                validator:
                    (v) =>
                        v == null || v.isEmpty
                            ? context.tr(LocaleKeys.emptyPhoneNumber)
                            : (v.length < 10
                                ? context.tr(LocaleKeys.phoneNumberIsTooShort)
                                : null),
                controller: phoneController,
              ),

              SizedBox(height: heightOf(24, context)),

              FilledTextButton(
                action: () {
                  if(_formKey.currentState!.validate()){
                    //todo
                  }
                },
                text: context.tr(LocaleKeys.createAccount),
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
    );
  }
}
