import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/Search/search_screen.dart';
import 'package:movie/home/browse/browse_screen.dart';
import 'package:movie/home/cubit/main_page_state.dart';
import 'package:movie/home/cubit/main_page_view_mode;.dart';
import 'package:movie/home/home_page/home_page.dart';
import 'package:movie/home/profile_page/profile_page.dart';
import 'package:movie/home/widgets/loading_widget.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageViewModel viewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<MainPageViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageViewModel,MainPageState>(
      bloc:viewModel,
      builder: (context, state) {
        List<Widget> tabs = [HomePage(),SearchScreen(),BrowseScreen(initialIndex: viewModel.browseIndex,),ProfilePage()];
        if(state is NavigatedSuccessfully || state is InitState){
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: context.height,
                child: Stack(
                  children: [
                    tabs[viewModel.currentIndex],
                    Positioned(
                        bottom: 5,
                        left: 9,
                        right: 9,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.darkGray,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              bottomNavigationBarItem(iconPath: AppAssets.home, index: 0),
                              bottomNavigationBarItem(iconPath: AppAssets.search, index: 1),
                              bottomNavigationBarItem(iconPath: AppAssets.explore, index: 2),
                              bottomNavigationBarItem(iconPath: AppAssets.profile, index: 3),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        }
        else{
          return LoadingWidget();
        }

    },);

  }

  Widget bottomNavigationBarItem({required String iconPath,required int index}) {
    return GestureDetector(onTap: (){
      viewModel.changeIndex(index: index);
    },
      child: SvgPicture.asset(iconPath,color: viewModel.currentIndex == index?AppColors.accentYellow:null,),
    );
  }
}