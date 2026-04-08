import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/repository/movies/repository/movies_repository.dart';
import '../../../../../models/movie_response.dart';
import 'trend_movies_state.dart';

class TrendMoviesViewModel extends Cubit<TrendMoviesState>{
  MoviesRepository moviesRepository;
  TrendMoviesViewModel({required this.moviesRepository}):super(TrendMoviesLoadingState());
  Future<void> getMovies() async{
    try{
      emit(TrendMoviesLoadingState());
      var response = await moviesRepository.getMovies(orderBy: "desc",sortBy: "year",);
      if(response.status == "error"){
        emit(TrendMoviesErrorState(errorMessage: response.statusMessage!));
        return;
      }
      if(response.status == "ok"){
        emit(TrendMoviesSuccessState(moviesList: response.data!.movies!));
        return;
      }
    }
    catch(e){
      if(e.toString().contains("ClientException with SocketException")){
        emit(TrendMoviesErrorState(errorMessage: "Network Problem"));
        return;
      }
      emit(TrendMoviesErrorState(errorMessage: e.toString()));
    }
  }
}