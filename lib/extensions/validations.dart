import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../lang/locale_keys.g.dart';

extension Validations on String? {
  String? emailValidation(BuildContext context) {
    if (this == null || this!.trim().isEmpty) {
      return context.tr(LocaleKeys.emailIsRequired);
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this!);
    if (!emailValid) {
      return context.tr(LocaleKeys.invalidEmail);
    }
    return null;
  }

  String? passwordValidation(
    BuildContext context, [
    String? password,
    bool confirmPassword = false,
  ]) {
    if (this == null || this!.trim().isEmpty) {
      if (confirmPassword && password != null && password.isNotEmpty) {
                return context.tr(LocaleKeys.passwordsDoNotMatch);
      }
      return context.tr(LocaleKeys.passwordIsRequired);
    }
    if (confirmPassword) {
      if (password != this) {
        return context.tr(LocaleKeys.passwordsDoNotMatch);
      }
    }
    else if (this!.length < 6) {
      return context.tr(LocaleKeys.passwordTooShort);
    }
    return null;
  }

  String? userNameValidation(BuildContext context) {
    if (this == null || this!.trim().isEmpty) {
      return context.tr(LocaleKeys.nameIsRequired);
    }
    return null;
  }

  String? phoneValidation(BuildContext context) {
    if (this == null || this!.isEmpty) {
      return context.tr(LocaleKeys.emptyPhoneNumber);
    } else if (this!.length < 10) {
      return context.tr(LocaleKeys.phoneNumberIsTooShort);
    }
    return null;
  }
}
