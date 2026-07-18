import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/repository/movie%20suggestions/repository/movies_suggestions_repository.dart';
import 'package:movie/models/movie_details.dart';
import 'package:movie/models/movie_response.dart';

import '../../../core/utils/firebase_utils.dart';
import 'movie_details_states.dart';
import 'package:movie/data/repository/movie details/repository/movie_details_repository.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsStates>{
  MovieDetailsRepository movieDetailsRepository;
  MoviesSuggestionsRepository moviesSuggestionsRepository;
  MovieDetailsViewModel({required this.movieDetailsRepository, required this.moviesSuggestionsRepository}):super(Loading());
  Future<void> getMovieData(String movieID) async {
    MovieDetails? movie;
    MovieResponse? moviesSuggestions;
    try{
      movie =  await movieDetailsRepository.getMovieDetails(movieID);
      moviesSuggestions = await moviesSuggestionsRepository.getMoviesSuggestions(movieID);
    }catch(e){
      emit(Error(e.toString()));
      return;
    }
    emit(Success(movie,moviesSuggestions));
  }
}