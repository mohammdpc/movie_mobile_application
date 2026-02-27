import 'package:movie/data/repository/movies/data_sources/remote/movies_remote_data_source.dart';
import 'package:movie/data/repository/movies/repository/movies_repository.dart';
import '../../../../../models/movie_response.dart';

class MoviesRepositoryImpl implements MoviesRepository{
  MoviesRemoteDataSource remoteDataSource;
  MoviesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<MovieResponse> getMovies({String? sortBy,String? orderBy,String? genre,String? limit}) {
    return remoteDataSource.getMovies(sortBy:sortBy,orderBy: orderBy,genre: genre,limit: limit );
  }
}