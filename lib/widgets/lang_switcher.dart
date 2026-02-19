

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import '../core/utils/app_assets.dart';
import '../core/utils/app_colors.dart';

class LangSwitcher extends StatefulWidget {
  static const String routeName = 'switch';

  const LangSwitcher({super.key});

  @override
  State<LangSwitcher> createState() => _LangSwitcherState();
}

class _LangSwitcherState extends State<LangSwitcher> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        height: 39,
        width: 92,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.transparentColor,
          border: Border.all(color: AppColors.accentYellow, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await context.setLocale(Locale('en'));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                    context.locale.languageCode == 'en'
                            ? AppColors.accentYellow
                            : AppColors.transparentColor,
                    width: 4,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.en),
              ),
            ),

            GestureDetector(
              onTap: () async {
                await context.setLocale(Locale('ar'));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 230),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                    context.locale.languageCode == 'ar'
                            ? AppColors.accentYellow
                            : AppColors.transparentColor,
                    width: 4,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.eg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
