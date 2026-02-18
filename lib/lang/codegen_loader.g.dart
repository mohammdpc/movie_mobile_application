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
  "pick_avatar": "اختر صورة شخصية",
  "update_data": "تحديث البيانات",
  "reset_password": "إعادة تعيين كلمة المرور",
  "delete_account": "حذف الحساب"
};
static const Map<String,dynamic> _en = {
  "pick_avatar": "Pick Avatar",
  "update_data": "Update Data",
  "reset_password": "Reset Password",
  "delete_account": "Delete Account"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
