import '../../../../../models/movie_response.dart';

abstract class TrendMoviesState{}
class TrendMoviesSuccessState extends TrendMoviesState{
  List<Movies> moviesList;
  TrendMoviesSuccessState({required this.moviesList});
}
class TrendMoviesLoadingState extends TrendMoviesState{}
class TrendMoviesErrorState extends TrendMoviesState{
  String errorMessage;
  TrendMoviesErrorState({required this.errorMessage});
}