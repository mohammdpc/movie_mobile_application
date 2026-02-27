import 'package:flutter/material.dart';
import 'package:movie/extensions/device_dimensions.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class SeeMoreWidget extends StatelessWidget {
  final VoidCallback onPress;
  const SeeMoreWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //todo:see more logic
        onPress.call();
      },
      child: Row(
        spacing: context.calcOnWidth(2),
        children: [
          Text("See More",style: AppStyles.regular16AccentYellow,),
          Icon(Icons.arrow_forward,size: 15,color: AppColors.accentYellow,),
        ],
      ),
    );
  }
}
