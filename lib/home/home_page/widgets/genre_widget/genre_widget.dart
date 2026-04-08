

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/extensions/device_dimensions.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_view_model.dart';
import 'package:movie/home/home_page/widgets/genre_widget/widgets/genre_title_bar.dart';

import '../../../../di.dart';
import '../../../movie_details/movie_details_screen.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/main_error_widget.dart';
import '../movie_child_widget.dart';
import 'cubit/genre_state.dart';

class GenreWidget extends StatefulWidget {
  final String genre;
  const GenreWidget({super.key, required this.genre, });

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  GenreViewModel viewModel = GenreViewModel(
    moviesRepository: injectMoviesRepository(),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMovieByGenre(imdbGenre: widget.genre);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreViewModel, GenreState>
      (
      bloc: viewModel,
      builder: (context, state) {
      return Column(
        spacing: context.calcOnHeight(12),
        children: [
          GenreTitleBar(title: widget.genre,),
          state is GenreErrorState? MainErrorWidget(
          errorMessage: state.errorMessage,
          onPressed: () {
          viewModel.getMovieByGenre(imdbGenre: widget.genre);
          },
          ): state is OneGenreSuccessState?
          SizedBox(
            height: 220,
            child: ListView.separated(
              padding: EdgeInsets.only(left: context.calcOnWidth(8)),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieChildWidget(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailsScreen(movieID: state.movies[index].id.toString())));
                }, imgPath: state.movies[index].mediumCoverImage??"", rating: "${state.movies[index].rating}", top: 13, left: 14);
              }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: context.calcOnWidth(20),);
            },),
          ):
          SizedBox(
              height: 220,
              child: LoadingWidget()) ,

        ],
      );
    },);
  }
}
