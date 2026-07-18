import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/data/constants/imdb_genres.dart';

class GenreCard extends StatelessWidget {
  final int index;
  final bool selected;
  const GenreCard({super.key, required this.index, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widthOf(15, context),
      ),
      decoration: BoxDecoration(
        color: selected ? AppColors.accentYellow : AppColors.transparentColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
            width: 2, color: AppColors.accentYellow
        ),
      ),
      child: Center(
        child: Text(
          ImdbGenres.all[index],
          style: selected ? AppStyles.bold20Black : AppStyles.bold20Yellow,
        ),
      ),
    );
  }
}
