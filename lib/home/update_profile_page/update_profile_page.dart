import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test")),
      body: Column(
        spacing: context.height*0.02,
        children: [
          CustomTextField(),
          CustomElevatedButton(
            function: () {},
            text: "Login With Google",
            textStyle: AppStyles.regular20White,
            backgroundColor: AppColors.red,
            borderColor: AppColors.red,
            icon: SvgPicture.asset(
              AppAssets.googleIcon,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
