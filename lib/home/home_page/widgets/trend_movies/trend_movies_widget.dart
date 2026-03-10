import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/trend_movies/widgets/back_ground_image.dart';
import 'package:movie/home/home_page/widgets/trend_movies/widgets/back_ground_image_shadow.dart';
import 'package:movie/home/home_page/widgets/movie_child_widget.dart';
import 'package:movie/home/home_page/widgets/trend_movies/widgets/dynamic_viewport_and_enlarge_factor.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import 'package:movie/home/widgets/main_error_widget.dart';
import '../../../../core/utils/app_assets.dart';
import 'cubit/trend_movies_state.dart';
import 'cubit/trend_movies_view_model.dart';

class TrendMoviesWidget extends StatefulWidget {
  const TrendMoviesWidget({super.key});

  @override
  State<TrendMoviesWidget> createState() => _TrendMoviesWidgetState();
}

class _TrendMoviesWidgetState extends State<TrendMoviesWidget> {
  late TrendMoviesViewModel viewModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = context.read<TrendMoviesViewModel>();
    viewModel.getMovies();
  }
  // TrendMoviesViewModel viewModel = TrendMoviesViewModel(
  //   moviesRepository: injectMoviesRepository(),
  // );
  int currentIndex = 0;
  bool isLoaded = false;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is TrendMoviesSuccessState) {
          return Stack(
            alignment: Alignment.center,
            children: [
              BackGroundImage(imgPath: state.moviesList[currentIndex].largeCoverImage ?? "",),
              BackGroundImageShadow(),
              CarouselSlider.builder(
                itemCount: state.moviesList.length,
                carouselController: _controller,
                options: CarouselOptions(
                  aspectRatio: context.calcOnWidth(234) / context.calcOnHeight(351),
                  viewportFraction: getViewportFraction(context.width),
                  enlargeCenterPage: true,
                  enlargeFactor: getEnlargeFactor(context.width),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                      isLoaded = false;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return SizedBox(
                    height: context.calcOnHeight(351),
                    width: context.calcOnWidth(234),
                    child: MovieChildWidget(
                      onPress: () {
                        if (currentIndex != index) {
                          _controller.animateToPage(index);
                        }
                      },
                      imgPath: state.moviesList[index].mediumCoverImage ?? "",
                      rating: "${state.moviesList[index].rating}", top: 11, left: 9,
                    ),
                  );
                },
              ),
              Positioned(top: 7, child: Image.asset(AppAssets.availableNow)),
              Positioned(bottom: 0, child: Image.asset(AppAssets.watchNow)),
            ],
          );
        } else if (state is TrendMoviesErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getMovies();
            },
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }


}
