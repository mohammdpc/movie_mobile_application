import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';

class ProfileDataWidget extends StatelessWidget {
  final int number;
  final String title;
  const ProfileDataWidget({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$number",style: AppStyles.bold24White.copyWith(fontSize: 36),),
        Text(title,style: AppStyles.bold24White,),

      ],
    );
  }
}
