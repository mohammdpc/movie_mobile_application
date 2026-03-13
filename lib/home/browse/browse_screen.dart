import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/app_utils.dart';
import 'package:movie/data/constants/imdb_genres.dart';
import 'package:movie/di.dart';
import 'package:movie/home/browse/cubit/browse_cubit.dart';
import 'package:movie/home/browse/widgets/genre_card.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_state.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_view_model.dart';
import 'package:movie/home/home_page/widgets/movie_child_widget.dart';
import 'package:movie/home/movie_details/movie_details_screen.dart';
import 'package:movie/home/widgets/loading_widget.dart';
import 'package:movie/home/widgets/main_error_widget.dart';
import 'package:movie/models/movie_response.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  GenreViewModel genreViewModel = GenreViewModel(
    moviesRepository: injectMoviesRepository(),
  );
  BrowseCubit browseCubit = BrowseCubit();
  @override
  void initState() {
    genreViewModel.getMoviesByGenre(limit: 50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreViewModel, GenreState>(
      bloc: genreViewModel,
      builder: (context, state) {
        if (state is GenreLoadingState) {
          return LoadingWidget();
        } else if (state is GenreErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              genreViewModel.getMoviesByGenre();
            },
          );
        } else if (state is GenreSuccessState) {
          return SafeArea(
            child: BlocBuilder<BrowseCubit,int>(
              bloc: browseCubit,
              builder: (context,genreIndex) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthOf(16, context)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth(context),
                        height: heightOf(48, context),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: ImdbGenres.all.length,
                          itemBuilder:
                              (context, index) => InkWell(
                                onTap: (){
                                  browseCubit.changeGenre(index);
                                },
                                child: GenreCard(
                                  index: index,
                                  selected: genreIndex == index,
                                ),
                              ),
                          separatorBuilder: (context,index)=>SizedBox(width: widthOf(8, context),),
                        ),
                      ),
                      SizedBox(height: heightOf(25, context),),
                      Expanded(
                        child: GridView.builder(
                          itemCount: state.moviesGroups[genreIndex].length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: heightOf(8, context),
                            crossAxisSpacing: widthOf(20, context),
                            childAspectRatio: 0.677419355,
                          ),
                          itemBuilder: (context, index) {
                            Movies movie = state.moviesGroups[genreIndex][index];
                            return MovieChildWidget(
                              onPress:
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => MovieDetailsScreen(
                                            movieID: movie.id.toString(),
                                          ),
                                    ),
                                  ),
                              imgPath: movie.mediumCoverImage!,
                              rating: movie.rating.toString(),
                              top: heightOf(13, context),
                              left: heightOf(10, context),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          );
        } else {
          return Placeholder();
        }
      },
    );
  }
}
