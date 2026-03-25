import 'package:movie/models/movie_response.dart';

abstract class SearchState {}
class SearchLoadingState extends SearchState{}
class SearchSuccessState extends SearchState{
  List<Movies> movies;
  SearchSuccessState({required this.movies});
}
class SearchErrorState extends SearchState{
  String errorMessage;
  SearchErrorState(this.errorMessage);
}