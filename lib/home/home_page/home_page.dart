import 'package:flutter/material.dart';

import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/genre_widget/genre_bloc_widget.dart';
import 'package:movie/home/home_page/widgets/trend_movies/trend_movies_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: context.calcOnHeight(654),
                child: TrendMoviesWidget(),
              ),
              GenreBlocWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
