import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_utils.dart';

class LangSwitcher extends StatefulWidget {
  static const String routeName = 'switch';

  const LangSwitcher({super.key});

  @override
  State<LangSwitcher> createState() => _LangSwitcherState();
}

class _LangSwitcherState extends State<LangSwitcher> {
  String currentLang = 'en';

  @override
  Widget build(BuildContext context) {

    return Container(
      height: heightOf(37.89, context),
      width: widthOf(92.11, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.transparentColor,
        border: Border.all(color: AppColors.accentYellow, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async{
              await context.setLocale(Locale('en'));
              currentLang = context.locale.languageCode;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      currentLang == 'en'
                          ? AppColors.accentYellow
                          : AppColors.transparentColor,
                  width: 4,
                ),
              ),
              child: SvgPicture.asset(AppAssets.lr,),
            ),
          ),

          InkWell(
            onTap: () async{
              //currentLang = 'ar';
              await context.setLocale(Locale('ar'));
              currentLang = context.locale.languageCode;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      currentLang == 'ar'
                          ? AppColors.accentYellow
                          : AppColors.transparentColor,
                  width: 4,
                ),
              ),
              child: SvgPicture.asset(AppAssets.eg,),
            ),
          ),
        ],
      ),
    );
  }
}
