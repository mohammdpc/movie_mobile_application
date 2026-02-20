import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

import '../../core/utils/app_utils.dart';
import '../../widgets/lang_switcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: context.height * 0.025,
              children: [
                SizedBox(height: height * 0.02),
                Center(child: Image.asset(AppAssets.logoMovie)),
                CustomTextField(
                  borderRadius: 16,
                  prefixIcon: Icon(Icons.email, color: AppColors.white),
                  hintText: 'email'.tr(),
                  hintStyleDark: Theme.of(context).textTheme.titleLarge,
                ),
                CustomTextField(
                  isPassword: true,
                  obscure: true,
                  borderRadius: 16,
                  prefixIcon: Icon(Icons.lock, color: AppColors.white),
                  hintText: 'password'.tr(),
                  hintStyleDark: Theme.of(context).textTheme.titleLarge,
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.only(bottom: context.height * 0.01),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    //المفروض لما يضغط عليها يروح للصفحه اللي تعمله باسوورد تاني
                  },
                  child: Text(
                    'forget_password_question'.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.accentYellow,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  function: () {
                    //just for testing
                    Navigator.of(context).pushNamed(AppRoutes.updateProfileScreen);
                  },
                  text: 'login'.tr(),
                  textStyle: AppStyles.regular20Black,

                  backgroundColor: AppColors.accentYellow,
                ),
                Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont_have_account'.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                      },
                      child: Text(
                        'create_one'.tr(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.accentYellow),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.accentYellow,
                        indent: 30,
                        endIndent: 30,
                      ),
                    ),
                    Text(
                      'or'.tr(),
                      style: AppStyles.regular15AccentYellow,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.accentYellow,
                        indent: 30,
                        endIndent: 30,
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  function: () {
                    //المفروض نخليه يدخب بجوجل هتتعمل ب api باين:todo
                  },
                  icon: SvgPicture.asset(AppAssets.googleIcon),
                  text: 'login_with_google'.tr(),
                  textStyle: AppStyles.regular20Black,

                  backgroundColor: AppColors.accentYellow,
                ),

                SizedBox(height: heightOf(18.25, context)),
                Center(child: LangSwitcher()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
