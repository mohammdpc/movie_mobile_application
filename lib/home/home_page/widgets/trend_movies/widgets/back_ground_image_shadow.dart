import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class BackGroundImageShadow extends StatelessWidget {
  const BackGroundImageShadow({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
    );
  }
}
