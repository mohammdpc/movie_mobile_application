import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/utils/app_assets.dart';
import 'package:movie/core/utils/app_colors.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/trend_movies_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  PageController _pageController = PageController(
    viewportFraction: 0.78,
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TrendMoviesWidget(),
              Text("Action"),
            ],
          ),
        ),
      ),
    );
  }
}
