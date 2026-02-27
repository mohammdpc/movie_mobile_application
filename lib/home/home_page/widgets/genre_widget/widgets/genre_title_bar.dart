import 'package:flutter/material.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/genre_widget/widgets/see_more_widget.dart';

import '../../../../../core/utils/app_styles.dart';

class GenreTitleBar extends StatelessWidget {
  final String title;
  const GenreTitleBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.calcOnWidth(8)),
      child: Row(
        children: [
          Expanded(child: Text(title,style: AppStyles.regular20White,)),
          SeeMoreWidget(onPress: () {},),
        ],
      ),
    );
  }
}
