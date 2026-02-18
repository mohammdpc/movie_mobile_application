// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "register": "تسجيل",
  "avatar": "صورة رمزية",
  "email": "البريد إلكتروني",
  "name": "الاسم",
  "password": "كلمة مرور",
  "confirmPassword": "تأكيد كلمة المرور",
  "phoneNumber": "رقم هاتف",
  "createAccount": "إنشاء حساب",
  "alreadyHasAnAccount": "لديك حساب بالفعل؟",
  "login": "تسجيل الدخول",
  "invalidEmail": "بريد إلكتروني غير صالح",
  "addEmail": "الرجاء إدخال بريد إلكتروني صحيح",
  "passwordIsRequired": "كلمة المرور مطلوبة",
  "passwordTooShort": "يجب أن تتكون كلمة المرور من ٨ أحرف على الأقل",
  "emptyPhoneNumber": "رقم الهاتف مطلوب",
  "phoneNumberIsTooShort": "رقم الهاتف قصير جدًا",
  "nameIsRequired": "الاسم مطلوب"
};
static const Map<String,dynamic> _en = {
  "register": "Register",
  "avatar": "Avatar",
  "email": "Email",
  "name": "Name",
  "password": "Password",
  "confirmPassword": "Confirm Password",
  "phoneNumber": "Phone Number",
  "createAccount": "Create Account",
  "alreadyHasAnAccount": "Already Have Account ?",
  "login": "Login",
  "addEmail": "Please enter a valid email address",
  "invalidEmail": "Invalid Email",
  "passwordIsRequired": "Password is required",
  "passwordTooShort": "Password must be at least 8 characters",
  "emptyPhoneNumber": "Phone number is required",
  "phoneNumberIsTooShort": "Phone number is too short",
  "nameIsRequired": "Name is required"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
