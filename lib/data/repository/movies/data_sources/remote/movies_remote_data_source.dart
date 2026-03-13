
import '../../../../../models/movie_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponse> getMovies({String? sortBy,String? orderBy,String? genre,String? limit,String? queryTerm});
}