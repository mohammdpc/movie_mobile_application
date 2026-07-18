import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/genre_widget/genre_bloc_widget.dart';
import 'package:movie/home/home_page/widgets/trend_movies/cubit/trend_movies_state.dart';
import 'package:movie/home/home_page/widgets/trend_movies/cubit/trend_movies_view_model.dart';
import 'package:movie/home/home_page/widgets/trend_movies/trend_movies_widget.dart';

import '../../di.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  TrendMoviesViewModel viewModel = TrendMoviesViewModel(moviesRepository: injectMoviesRepository());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => viewModel),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<TrendMoviesViewModel, TrendMoviesState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: state is TrendMoviesLoadingState
                          ? context.height
                          : context.calcOnHeight(654),
                      child: TrendMoviesWidget(),
                    ),

                    state is TrendMoviesLoadingState
                        ? SizedBox()
                        : GenreBlocWidget(),
                    SizedBox(height: 70,),
                  ],
                ),
              );

            },
          ),
        ),
      ),
    );
  }
}
