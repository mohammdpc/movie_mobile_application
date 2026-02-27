import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/home_page.dart';
import 'package:movie/home/update_profile_page/update_profile_page.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomePage(),HomePage(),HomePage(),UpdateProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
             tabs[selectedIndex],
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

  Widget bottomNavigationBarItem({required String iconPath,required int index}) {
    return GestureDetector(onTap: (){
      setState(() {
        selectedIndex = index;
      });
    },
      child: SvgPicture.asset(iconPath,color: selectedIndex == index?AppColors.accentYellow:null,),
    );
  }
}