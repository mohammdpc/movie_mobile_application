import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/authentication/cubit/auth_state.dart';
import 'package:movie/authentication/cubit/auth_view_model.dart';
import 'package:movie/authentication/reset_password/reset_navigator.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/lang/locale_keys.g.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/app_utils.dart';
import '../../core/utils/dialog_utils.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>implements ResetNavigator {
  final _emailController = TextEditingController();
  late AuthViewModel viewModel ;
  int avatarIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<AuthViewModel>();
    viewModel.resetNavigator = this;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale.languageCode == "en";
    return BlocListener<AuthViewModel,AuthState>(listener: (context, state) {},
      child:Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.forget_password.tr()),
        ),
        body: Form(
          key: viewModel.resetFormKey,
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
                      if (viewModel.resetFormKey.currentState!.validate()) {
                        viewModel.sendPasswordResetEmail(_emailController.text);
                      }
                    },
                    text: LocaleKeys.verify_email.tr(),
                    textStyle: AppStyles.regular20Black,
                  ),
                ],

              ),
            ),
          ),
        ),
      ),);
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
        posAction: () {Navigator.of(context,).pop();
        }
    );
  }

  @override
  void hideDialog() {
    // TODO: implement hideDialog
    DialogUtils.hideDialog(context: context);
  }
}
