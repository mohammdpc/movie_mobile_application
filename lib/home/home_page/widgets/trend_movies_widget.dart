import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/extensions/device_dimensions.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class TrendMoviesWidget extends StatelessWidget {
  const TrendMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.calcOnHeight(654),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/1917_large.png"),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withValues(alpha: 0.8),
                    AppColors.black.withValues(alpha: 0.6),
                    AppColors.black,
                  ],
                ),
              ),
            ),
          ),
          CarouselSlider(
            items: [
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/1917_medium.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 11,
                      ),
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
                          Text("7.7", style: AppStyles.regular16White),
                          SvgPicture.asset(
                            AppAssets.star,
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              // height: context.calcOnHeight(351),
              aspectRatio: 234 / 351,
              viewportFraction: 0.54,
              enlargeFactor: 0.42,
              enlargeCenterPage: true,
            ),
          ),
          Positioned(top: 7, child: Image.asset(AppAssets.availableNow)),
          Positioned(bottom: 0, child: Image.asset(AppAssets.watchNow)),
        ],
      ),
    );
  }
}
