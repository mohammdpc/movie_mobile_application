import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/app_utils.dart';

class CastCard extends StatelessWidget {
  final String? image;
  final String name;
  final String character;
  const CastCard({super.key, required this.image ,required this.name ,required this.character ,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widthOf(11, context)),
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child:Row(
        spacing: widthOf(10, context),
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            child: image== null||image == ''?Icon(Icons.person,size: widthOf(70, context),):Image.network(image!,fit: BoxFit.fitHeight,),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $name',style:AppStyles.regular20White.copyWith(decoration: TextDecoration.none),textAlign: TextAlign.left,),
                Text('Character: $character',style:AppStyles.regular20White.copyWith(decoration: TextDecoration.none)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
