import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/extensions/device_dimensions.dart';

import '../../../../data/constants/imdb_genres.dart';
import '../../../../di.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/main_error_widget.dart';
import 'cubit/genre_state.dart';
import 'cubit/genre_view_model.dart';
import 'genre_widget.dart';

class GenreBlocWidget extends StatefulWidget {
  const GenreBlocWidget({super.key});

  @override
  State<GenreBlocWidget> createState() => _GenreBlocWidgetState();
}

class _GenreBlocWidgetState extends State<GenreBlocWidget> {
  GenreViewModel viewModel = GenreViewModel(
    moviesRepository: injectMoviesRepository(),
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getMoviesByGenre();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreViewModel, GenreState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is GenreErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getMoviesByGenre();
            },
          );
        } else if (state is GenreSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:
                (context, index) => GenreWidget(
                  genre: ImdbGenres.all[index],
                  moviesList: state.moviesGroups[index],
                ),
            separatorBuilder:
                (context, index) => SizedBox(height: context.calcOnHeight(20)),
            itemCount: ImdbGenres.all.length,
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
