import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
class GenresCard extends StatelessWidget {
  final String genre;
  const GenresCard({super.key,required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Center(child: Text(genre,style: AppStyles.regular16White.copyWith(decoration: TextDecoration.none),)),
    );
  }
}
