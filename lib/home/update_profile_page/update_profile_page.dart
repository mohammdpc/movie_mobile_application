import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/home/update_profile_page/widgets/bottom_dialog.dart';
import 'package:movie/lang/locale_keys.g.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';

class UpdateProfilePage extends StatefulWidget {
  UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController userNameController = TextEditingController(
    text: "John Safwat",
  );
  TextEditingController phoneController = TextEditingController(
    text: "01200000000",
  );
  int currentIconIndex = 2;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: ListView(
        padding: EdgeInsets.only(
          top: context.height * 0.06,
          bottom: context.height * 0.01,
          left: context.width * 0.017,
          right: context.width * 0.017,
        ),
        shrinkWrap: true,
        children: [
          CustomElevatedButton(
            function: () {
              // todo: Delete account logic
            },
            text: LocaleKeys.delete_account.tr(),
            textStyle: AppStyles.regular20White,
            backgroundColor: AppColors.red,
            borderColor: AppColors.red,
          ),
          SizedBox(height: context.height * 0.0214,),
          CustomElevatedButton(
            function: () {
              if (_formKey.currentState!.validate()) {
                print("Form is valid! Proceeding...");
              } else {
                print("Form has errors.");
              }
              // todo: Update account logic
            },
            text: LocaleKeys.update_data.tr(),
            textStyle: AppStyles.regular20Black,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(LocaleKeys.pick_avatar.tr(), style: AppStyles.regular16AccentYellow),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
            top: context.height * 0.06,
            bottom: context.height * 0.008,
            left: context.width * 0.017,
            right: context.width * 0.017,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.height * 0.0214,
              children: [
                GestureDetector(
                  onTap: () {
                    BottomDialog.showGridBottomDialog(context, currentIconIndex, (int index,)
                    {
                      setState(() {
                        currentIconIndex = index + 1;
                        Navigator.of(context).pop();
                      });
                    });
                  },
                  child: Center(
                    child: Image.asset(
                      "${AppAssets.baseUrl}gamer$currentIconIndex.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 0),
                CustomTextField(
                  validator: (name)=>name.userNameValidation(context),
                  prefixPadding: const EdgeInsets.only(left: 16, right: 14),
                  controller: userNameController,
                  textStyle: AppStyles.regular20White,
                  verticalPadding: 16,
                  prefixIcon: SvgPicture.asset(AppAssets.userIcon),
                ),
                CustomTextField(
                  validator: (phone)=>phone.phoneValidation(context),
                  prefixPadding: const EdgeInsets.only(left: 16, right: 14),
                  controller: phoneController,
                  textStyle: AppStyles.regular20White,
                  verticalPadding: 16,
                  prefixIcon: SvgPicture.asset(AppAssets.phoneIcon),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.resetPasswordScreen);
                  },
                  child: Text(LocaleKeys.reset_password.tr(), style: AppStyles.regular20White),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
