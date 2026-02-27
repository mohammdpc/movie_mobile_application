import 'package:easy_localization/easy_localization.dart';
// import 'package:easy_localization/easy_localization.dart' as verify_email;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

import '../../lang/locale_keys.g.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: ImageIcon(AssetImage(AppAssets.arrowIcon)),),
        title: Text(  context.tr(LocaleKeys.forget_password),style: TextStyle(color: AppColors.accentYellow),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ),
        child: SingleChildScrollView(
          child: Column(
              spacing: 20,
            children: [
              Image.asset(AppAssets.forgetImage,width: context.width,fit: BoxFit.contain,),
          
              CustomTextField(prefixPadding:EdgeInsets.only(right: 5,left: 9),hintText: context.tr(LocaleKeys.email),
                prefixIcon:Image.asset(AppAssets.emailIconPng),
                textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
              CustomElevatedButton(function: (){
                //todo :Firebase reset password
              }, text: context.tr(LocaleKeys.verify_email),
                textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    );
  }
  
}