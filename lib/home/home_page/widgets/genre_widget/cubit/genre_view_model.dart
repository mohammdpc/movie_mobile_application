import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/home/home_page/widgets/genre_widget/cubit/genre_state.dart';
import '../../../../../data/constants/imdb_genres.dart';
import '../../../../../data/repository/movies/repository/movies_repository.dart';
import '../../../../../models/movie_response.dart';

class GenreViewModel extends Cubit<GenreState>{
  final MoviesRepository moviesRepository;
  GenreViewModel({required this.moviesRepository}):super(GenreLoadingState());
  Future<void> getMoviesByGenre({int limit = 20,}) async {
    List<List<Movies>> moviesGroups = [];
    try{
      emit(GenreLoadingState());
      // var response = await moviesRepository.getMovies(genre: genre,sortBy:"like_count");

      for(int i = 0;i<ImdbGenres.all.length;i++){
        var response = await moviesRepository.getMovies(genre: ImdbGenres.all[i],sortBy:"like_count",limit: limit.toString(),);
        if(response.status == "error"){
          emit(GenreErrorState(errorMessage: response.statusMessage!));
          return;
        }
        moviesGroups.add(response.data?.movies ?? []);
      }
        emit(GenreSuccessState(moviesGroups: moviesGroups));
        return;
    }
    catch(e){
      emit(GenreErrorState(errorMessage: e.toString()));
    }
  }
  Future<void> getMovieByGenre({int limit = 20,required String imdbGenre}) async {
    try{
      emit(GenreLoadingState());
      // var response = await moviesRepository.getMovies(genre: genre,sortBy:"like_count");
        var response = await moviesRepository.getMovies(genre: imdbGenre,sortBy:"like_count",limit: limit.toString(),);
        if(response.status == "error"){
          emit(GenreErrorState(errorMessage: response.statusMessage!));
          return;
        }
      emit(OneGenreSuccessState( movies: response.data?.movies ?? []));
      return;
    }
    catch(e){
      emit(GenreErrorState(errorMessage: e.toString()));
    }
  }
}