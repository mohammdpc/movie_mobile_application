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
  "nameIsRequired": "الاسم مطلوب",
  "pick_avatar": "اختر صورة شخصية",
  "update_data": "تحديث البيانات",
  "reset_password": "إعادة تعيين كلمة المرور",
  "username_empty": "اسم المستخدم لا يمكن أن يكون فارغاً",
  "phone_empty": "رقم الهاتف لا يمكن أن يكون فارغاً",
  "phone_invalid": "يجب أن يتكون رقم الهاتف من {} أرقام على الأقل",
  "forget_password_question": "نسيت كلمة المرور؟",
  "dont_have_account": "ليس لديك حساب؟",
  "create_one": "إنشاء حساب",
  "or": "أو",
  "login_with_google": "تسجيل الدخول عبر جوجل",
  "delete_account": "حذف الحساب"
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
  "nameIsRequired": "Name is required",
  "pick_avatar": "Pick Avatar",
  "update_data": "Update Data",
  "reset_password": "Reset Password",
  "username_empty": "Username cannot be empty",
  "phone_empty": "Phone number cannot be empty",
  "phone_invalid": "Phone number must be at least {} digits",
  "forget_password_question": "Forget Password?",
  "dont_have_account": "Don’t have an account ?",
  "create_one": "Create One",
  "or": "OR",
  "login_with_google": "Login With Google",
  "delete_account": "Delete Account"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
