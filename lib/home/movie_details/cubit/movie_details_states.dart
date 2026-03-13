import 'package:movie/models/movie_details.dart';
import 'package:movie/models/movie_response.dart';

abstract class MovieDetailsStates {}

class Loading extends MovieDetailsStates{}
class Success extends MovieDetailsStates{
  MovieDetails movie;
  MovieResponse movieSuggestions;
  Success(this.movie,this.movieSuggestions);
}
class Error extends MovieDetailsStates{
  String errorMessage;
  Error(this.errorMessage);
}