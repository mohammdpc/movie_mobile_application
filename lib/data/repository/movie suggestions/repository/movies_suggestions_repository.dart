import'package:movie/models/movie_response.dart';
abstract class MoviesSuggestionsRepository {
  Future<MovieResponse> getMoviesSuggestions(String id);

}