import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/authentication/cubit/auth_view_model.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_routes.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/extensions/validations.dart';
import 'package:movie/home/cubit/main_page_view_mode;.dart';
import 'package:movie/home/profile_page/user_navigator.dart';
import 'package:movie/home/profile_page/widgets/bottom_dialog.dart';
import 'package:movie/lang/locale_keys.g.dart';
import 'package:movie/widgets/custom_elevated_button.dart';
import 'package:movie/widgets/custom_text_field.dart';
import '../../authentication/cubit/auth_state.dart';
import '../../core/utils/dialog_utils.dart';
import 'cubit/user_state.dart';
import 'cubit/user_view_model.dart';

class UpdateProfilePage extends StatefulWidget {
  UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> implements UserNavigator {
  late TextEditingController userNameController ;
  late TextEditingController phoneController ;
  UserViewModel viewModel = UserViewModel();
  late int currentIconIndex ;
  late AuthViewModel authViewModel;
  late MainPageViewModel mainPageViewModel;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    // 1. Access the ViewModel/State once
    authViewModel = context.read<AuthViewModel>();
    mainPageViewModel = context.read<MainPageViewModel>();
    final state = authViewModel.state;

    if (state is AuthSuccessState) {
      viewModel.user = state.user;
    }

    // 2. Initialize controllers ONLY once
    userNameController = TextEditingController(text: viewModel.user.name);
    phoneController = TextEditingController(text: viewModel.user.phone);
    currentIconIndex = viewModel.user.avatarIndex;

    // 3. Setup the navigator
    viewModel.navigator = this;
  }

// Remove the logic from didChangeDependencies entirely
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserViewModel, UserState>(
      bloc: viewModel,
      listener: (context, state) {},
      child: Scaffold(
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
              function: () async {
                await viewModel.deleteUserAccount(viewModel.user.id);
                authViewModel.deleteAccount();
                mainPageViewModel.changeIndex(index: 0);
              },
              text: LocaleKeys.delete_account.tr(),
              textStyle: AppStyles.regular20White,
              backgroundColor: AppColors.red,
              borderColor: AppColors.red,
            ),
            SizedBox(height: context.height * 0.0214),
            CustomElevatedButton(
              function: () async {
                if (_formKey.currentState!.validate()) {
                  await viewModel.updateUser(id: viewModel.user.id, name: userNameController.text, email: viewModel.user.email,phone: phoneController.text, avatarIndex: currentIconIndex, authViewModel: authViewModel);
                }
              },
              text: LocaleKeys.update_data.tr(),
              textStyle: AppStyles.regular20Black,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            LocaleKeys.pick_avatar.tr(),
            style: AppStyles.regular16AccentYellow,
          ),
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
                      BottomDialog.showGridBottomDialog(
                        context,
                        currentIconIndex,
                        (int index) {
                          setState(() {
                            currentIconIndex = index + 1;
                            Navigator.of(context).pop();
                          });
                        },
                      );
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
                    validator: (name) => name.userNameValidation(context),
                    prefixPadding: const EdgeInsets.only(left: 16, right: 14),
                    controller: userNameController,
                    textStyle: AppStyles.regular20White,
                    verticalPadding: 16,
                    prefixIcon: SvgPicture.asset(AppAssets.userIcon),
                  ),
                  CustomTextField(
                    validator: (phone) => phone.phoneValidation(context),
                    prefixPadding: const EdgeInsets.only(left: 16, right: 14),
                    controller: phoneController,
                    textStyle: AppStyles.regular20White,
                    verticalPadding: 16,
                    prefixIcon: SvgPicture.asset(AppAssets.phoneIcon),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.resetPasswordScreen);
                    },
                    child: Text(
                      LocaleKeys.reset_password.tr(),
                      style: AppStyles.regular20White,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void showError({required String message}) {
    // TODO: implement showError
    DialogUtils.showMessage(
      title: "Error",
      customColor: AppColors.red,
      context: context,
      message: message,
      posActionName: "ok",
    );
  }

  @override
  void showMyLoading() {
    DialogUtils.showLoading(
      context: context,
      loadingMessage: "Loading...",
      textStyle: AppStyles.regular20White,
    );
  }

  @override
  void showSuccess({required String message,required bool isDelete}) {
    DialogUtils.showMessage(
        title: "Success",
        customColor: AppColors.green,
        context: context,
        dismissible: false,
        message:message,
        posActionName: "Ok",
        posAction: () {
          isDelete?Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false,):Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.mainScreen, (route) => false,);
        }
    );
  }

  @override
  void hideDialog() {
    DialogUtils.hideDialog(context: context);
  }
}
