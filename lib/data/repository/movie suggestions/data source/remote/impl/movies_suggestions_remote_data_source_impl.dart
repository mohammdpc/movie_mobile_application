import 'package:movie/api/api_manger.dart';
import 'package:movie/data/repository/movie%20suggestions/data%20source/remote/movies_suggestions_remote_data_source.dart';
import 'package:movie/models/movie_response.dart';

class MoviesSuggestionsRemoteDataSourceImpl extends MoviesSuggestionsRemoteDataSource{
  final ApiManger apiManger;
  MoviesSuggestionsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<MovieResponse> getMoviesSuggestions(String id) async{
    return await apiManger.getMovieSuggestions(id);
  }
}