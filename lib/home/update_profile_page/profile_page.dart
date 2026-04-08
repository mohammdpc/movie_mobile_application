import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/update_profile_page/historyOrWishList.dart';
import 'package:movie/home/update_profile_page/widgets/profile_data_widget.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import '../../authentication/cubit/auth_state.dart';
import '../../authentication/cubit/auth_view_model.dart';
import '../../core/utils/app_colors.dart';
import '../../lang/locale_keys.g.dart';
import '../../widgets/custom_elevated_button.dart';
import 'cubit/user_state.dart';
import 'cubit/user_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserViewModel viewModel;
  late int currentIconIndex;
  late int wishListNumber;
  late int historyNumber;
  late String userName;
  late AuthViewModel authViewModel;
  late List<String> wishList;
  late List<String> history;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authViewModel = context.read<AuthViewModel>();
    viewModel = context.read<UserViewModel>();
    final state = authViewModel.state;
    if (state is AuthSuccessState) {
      viewModel.user = state.user;
    }
    userName = viewModel.user.name;
    wishListNumber = viewModel.user.wishList.length;
    historyNumber = viewModel.user.history.length;
    currentIconIndex = viewModel.user.avatarIndex;
    wishList = viewModel.user.wishList;
    history = viewModel.user.history;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserViewModel, UserState>(
      bloc: viewModel,
      listenWhen: (previous, current) {
        if (current is UserWishListOrHistorySuccessState ) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        setState(() {
          historyNumber = viewModel.user.history.length;
          wishListNumber = viewModel.user.wishList.length;
        });
      },
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 1. The Profile Details Header
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.darkGray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.calcOnWidth(16),
                          right: context.calcOnWidth(16),
                          top: context.calcOnHeight(32),
                          bottom: context.calcOnHeight(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "${AppAssets.baseUrl}gamer$currentIconIndex.png",
                              width: 118,
                              height: 118,
                            ),
                            ProfileDataWidget(
                              number: wishListNumber,
                              title: LocaleKeys.wish_list.tr(),
                            ),
                            ProfileDataWidget(
                              number: historyNumber,
                              title: LocaleKeys.history.tr(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: context.calcOnWidth(20),
                          bottom: context.calcOnHeight(15),
                        ),
                        child: Text(
                          userName,
                          style: AppStyles.bold24White.copyWith(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: context.calcOnWidth(8),
                          right: context.calcOnWidth(8),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                function: () {},
                                text: LocaleKeys.edit_profile.tr(),
                                textStyle: AppStyles.regular20Black,
                              ),
                            ),
                            CustomElevatedButton(
                              horizontalPadding: context.calcOnWidth(31),
                              endIcon: SvgPicture.asset(AppAssets.exit),
                              function: () {},
                              text: LocaleKeys.exit.tr(),
                              textStyle: AppStyles.regular20White,
                              backgroundColor: AppColors.red,
                              borderColor: AppColors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 2. The TabBar (Pinned so it stays visible when scrolling down)
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  backgroundColor:AppColors.darkGray, // Matches your background
                  surfaceTintColor: Colors.transparent,
                  bottom: TabBar(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: AppColors.transparentColor,
                    tabs: [
                      tabWidget(
                        icon: AppAssets.list,
                        title: LocaleKeys.wish_list.tr(),
                      ),
                      tabWidget(
                        icon: AppAssets.folder,
                        title: LocaleKeys.history.tr(),
                      ),
                    ],
                  ),
                ),
              ),

            ];
          },
          // body: SizedBox(),
          // 3. The Body holds the scrollable GridViews
          body: TabBarView(children: [HistoryOrWishList( isHistory: false ,), HistoryOrWishList( isHistory: true,)]),
        ),
      ),
    );
  }

  Widget tabWidget({required icon, required title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        spacing: 9,
        children: [
          SvgPicture.asset(icon),
          Text(title, style: AppStyles.regular20White),
        ],
      ),
    );
  }
}
