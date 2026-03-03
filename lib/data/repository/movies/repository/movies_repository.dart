
import '../../../../models/movie_response.dart';

abstract class MoviesRepository {
  Future<MovieResponse> getMovies({String? sortBy,String? orderBy,String? genre,String? limit});
}