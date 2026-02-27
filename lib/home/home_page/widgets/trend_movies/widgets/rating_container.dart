import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class RatingContainer extends StatelessWidget {
  final String rating;
  const RatingContainer({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.71),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 5,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(rating, style: AppStyles.regular16White),
          SvgPicture.asset(
            AppAssets.star,
            height: 15,
            width: 15,
          ),
        ],
      ),
    );
  }
}
