import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/app_utils.dart';

class InfoCard extends StatelessWidget {
  final String icon;
  final String value;
  const InfoCard({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(icon,width: widthOf(28, context),),
          Text(value,style: AppStyles.bold24White,),
        ],
      ),
    );
  }
}
