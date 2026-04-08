import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/home/Search/cubit/search_state.dart';
import '../../../../../data/repository/movies/repository/movies_repository.dart';

class SearchCubit extends Cubit<SearchState>{
  MoviesRepository moviesRepository;
  SearchCubit(this.moviesRepository):super(SearchInitiateState());
  Future<void> searchMovie({int limit = 20,String? queryTerm}) async {
    try{
      emit(SearchLoadingState());
      var response = await moviesRepository.getMovies(sortBy:"like_count",queryTerm: queryTerm);
      emit(SearchSuccessState(movies:response.data!.movies!));
      return;
    }
    catch(e){
      emit(SearchErrorState(e.toString()));
    }
  }
}