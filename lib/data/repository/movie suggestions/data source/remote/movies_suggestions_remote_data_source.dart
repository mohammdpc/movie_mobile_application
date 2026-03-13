
import 'package:movie/models/movie_response.dart';

abstract class MoviesSuggestionsRemoteDataSource {
  Future<MovieResponse> getMoviesSuggestions(String id);
}