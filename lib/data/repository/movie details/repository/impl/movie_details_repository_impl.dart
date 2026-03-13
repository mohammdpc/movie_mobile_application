import 'package:movie/data/repository/movie details/repository/movie_details_repository.dart';
import 'package:movie/data/repository/movie details/data_sources/remote/movie_details_remote_data_source.dart';
import 'package:movie/models/movie_details.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository{
  MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepositoryImpl({required this.movieDetailsRemoteDataSource});
  @override
  Future<MovieDetails> getMovieDetails(String movieID) async {
    return await movieDetailsRemoteDataSource.getMovieDetails(movieID);
  }
}