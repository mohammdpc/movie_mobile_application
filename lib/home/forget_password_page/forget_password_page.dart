import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

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
        title: Text('Forget Password',style: TextStyle(color: AppColors.accentYellow),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ),
        child: Column(
            spacing: 20,
          children: [
            Image.asset(AppAssets.forgetImage,width: context.width,fit: BoxFit.contain,),

            CustomTextField(prefixPadding:EdgeInsets.only(right: 5,left: 9),hintText:'Email',
              prefixIcon:Image.asset(AppAssets.emailIcon),
              textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            CustomElevatedButton(function: (){
              //todo :Firebase reset password
            }, text: "Verify Email",
              textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
          ],
        ),
      ),
    );
  }
  
}