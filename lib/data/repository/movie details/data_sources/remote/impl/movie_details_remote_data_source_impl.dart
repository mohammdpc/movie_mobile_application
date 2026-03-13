import 'package:movie/data/repository/movie details/data_sources/remote/movie_details_remote_data_source.dart';
import 'package:movie/models/movie_details.dart';
import 'package:movie/api/api_manger.dart';

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource{
  ApiManger apiManger;
  MovieDetailsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<MovieDetails> getMovieDetails(String movieID) async{
    return await apiManger.getMovieDetails(movieID);
  }
}