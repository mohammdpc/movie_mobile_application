import 'package:movie/data/repository/movies/data_sources/remote/movies_remote_data_source.dart';
import '../../../../../../api/api_manger.dart';
import '../../../../../../models/movie_response.dart';
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource{
  ApiManger apiManger;
  MoviesRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<MovieResponse> getMovies({String? sortBy,String? orderBy,String? genre,String? limit,String? queryTerm}) async {
    var movieResponse = await apiManger.getMovies(sortBy: sortBy,orderBy: orderBy,genre: genre,limit: limit,queryTerm: queryTerm);
    return movieResponse;
  }
}