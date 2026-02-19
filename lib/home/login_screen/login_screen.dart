import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.symmetric(vertical:height*0.02 ,horizontal:width*0.02 ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             spacing: context.height *0.025,
             children: [
               SizedBox(height: height*0.02,),
            Center(child: Image.asset(AppAssets.logoMovie)),
               CustomTextField(
                 borderRadius: 16,
                 prefixIcon: Icon(Icons.email,color: AppColors.white,),
                 hintText: 'Email',
                 hintStyleDark: Theme.of(context).textTheme.titleLarge,
         
               ),
               CustomTextField(
                 isPassword: true,
                 obscure: true,
                 borderRadius: 16,
                 prefixIcon: Icon(Icons.lock,color: AppColors.white,),
                 hintText: 'Password',
                 hintStyleDark: Theme.of(context).textTheme.titleLarge,
                 suffixIcon: Icon(Icons.visibility_off),
         
               ),
               TextButton(
                   style: TextButton.styleFrom(
                     minimumSize: Size.zero,
                     padding: EdgeInsets.only(bottom: context.height*0.01),
                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                   ),
                   onPressed: (){
                 //المفروض لما يضغط عليها يروح للصفحه اللي تعمله باسوورد تاني
               },
                   child: Text('Forget Password ?',
                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
                       color: AppColors.accentYellow
                     ),)),
               CustomElevatedButton(
                   function: (){},
                   text:'Login' ,
                   textStyle: TextStyle(
                     color: AppColors.darkGray,
                     fontSize: 16,
                     fontWeight: FontWeight.w400
                   ),
                  backgroundColor: AppColors.accentYellow,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Don’t have an account ?',style: Theme.of(context).textTheme.titleMedium,),
                   TextButton(
                       onPressed: (){},
                       child:Text('Create One',style:Theme.of(context).textTheme.titleMedium!.copyWith(
                           color: AppColors.accentYellow
                       ) ,))
                 ],
               ),
               Row(
                 children: [
                   Expanded(
                     child: Divider(color: AppColors.accentYellow,
                       indent: 30,endIndent: 30,),
                   ),
                   Text('OR',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                       color: AppColors.accentYellow
                   ),),
                   Expanded(child: Divider(color: AppColors.accentYellow,indent: 30,endIndent: 30,)),
         
                 ],
               ),
               CustomElevatedButton(function: (){
                 //المفروض نخليه يدخب بجوجل هتتعمل ب api باين:todo
         
               },
                 icon: SvgPicture.asset(AppAssets.googleIcon),
                   text: 'Login With Google',
                   textStyle: TextStyle(
                       color: AppColors.darkGray,
                       fontSize: 16,
                       fontWeight: FontWeight.w400
                   ),
                 backgroundColor: AppColors.accentYellow,)
             ],
           ),
         ),
       ),
     ),
   );
  }

}