import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/lang/locale_keys.g.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/app_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale.languageCode == "en";
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.forget_password.tr()),
        ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.calcOnWidth(16)),
            child: Column(
              spacing: context.calcOnHeight(25),
              children: [
                Image.asset(AppAssets.forgetPasswordImage),
                CustomTextField(
                  prefixPadding: EdgeInsets.only(left: isEnglish? 9:5,right:isEnglish? 5:9),
                  prefixIcon: AppAssets.email,
                  hintText: context.tr(LocaleKeys.email),
                  verticalPadding: heightOf(11, context),
                  validator: (v) =>v.emailValidation(context),
                  controller: _emailController,
                ),
                CustomElevatedButton(
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      print("Form is valid! Proceeding...");
                    } else {
                      print("Form has errors.");
                    }
                    // todo: verify email logic
                  },
                  text: LocaleKeys.verify_email.tr(),
                  textStyle: AppStyles.regular20Black,
                ),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
