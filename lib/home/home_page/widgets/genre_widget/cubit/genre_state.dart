import '../../../../../models/movie_response.dart';

abstract class GenreState {}
class GenreSuccessState extends GenreState{
  List<List<Movies>> moviesGroups = [];
  GenreSuccessState({required this.moviesGroups});
}
class GenreErrorState extends GenreState{
  String errorMessage;
  GenreErrorState({required this.errorMessage});
}
class GenreLoadingState extends GenreState{}