
import 'package:movie/data/repository/movie%20suggestions/data%20source/remote/movies_suggestions_remote_data_source.dart';
import 'package:movie/data/repository/movie%20suggestions/repository/movies_suggestions_repository.dart';
import 'package:movie/models/movie_response.dart';

class MoviesSuggestionsRepositoryImpl extends MoviesSuggestionsRepository{
  MoviesSuggestionsRemoteDataSource moviesSuggestionsRemoteDataSource;
  MoviesSuggestionsRepositoryImpl({required this.moviesSuggestionsRemoteDataSource});

  @override
  Future<MovieResponse> getMoviesSuggestions(String id) {
    return moviesSuggestionsRemoteDataSource.getMoviesSuggestions(id);
  }
}