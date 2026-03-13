import 'package:movie/models/movie_details.dart';
abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> getMovieDetails(String movieID);
}