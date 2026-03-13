import 'package:movie/api/api_manger.dart';
import 'package:movie/data/repository/movie%20details/data_sources/remote/impl/movie_details_remote_data_source_impl.dart';
import 'package:movie/data/repository/movie%20details/data_sources/remote/movie_details_remote_data_source.dart';
import 'package:movie/data/repository/movie%20details/repository/impl/movie_details_repository_impl.dart';
import 'package:movie/data/repository/movie%20details/repository/movie_details_repository.dart';
import 'package:movie/data/repository/movie%20suggestions/data%20source/remote/impl/movies_suggestions_remote_data_source_impl.dart';
import 'package:movie/data/repository/movie%20suggestions/data%20source/remote/movies_suggestions_remote_data_source.dart';
import 'package:movie/data/repository/movie%20suggestions/repository/impl/movies_suggestions_repository_impl.dart';
import 'package:movie/data/repository/movie%20suggestions/repository/movies_suggestions_repository.dart';
import 'package:movie/data/repository/movies/data_sources/remote/impl/movies_remote_data_source_impl.dart';
import 'package:movie/data/repository/movies/data_sources/remote/movies_remote_data_source.dart';
import 'package:movie/data/repository/movies/repository/impl/movies_repository_impl.dart';
import 'package:movie/data/repository/movies/repository/movies_repository.dart';

MoviesRepository injectMoviesRepository(){
  return MoviesRepositoryImpl(remoteDataSource: injectMoviesDataSource());
}
MoviesRemoteDataSource injectMoviesDataSource(){
  return MoviesRemoteDataSourceImpl(apiManger: injectApiManger());
}
ApiManger injectApiManger(){
  return ApiManger();
}

MovieDetailsRemoteDataSource injectMoviesRemoteDataSource(){
  return MovieDetailsRemoteDataSourceImpl(apiManger: injectApiManger());
}


MovieDetailsRepository injectMovieDetailsRepository(){
  return MovieDetailsRepositoryImpl(movieDetailsRemoteDataSource: injectMoviesRemoteDataSource());
}

MoviesSuggestionsRemoteDataSource injectMoviesSuggestionsRemoteDataSource(){
  return MoviesSuggestionsRemoteDataSourceImpl(apiManger: injectApiManger());
}

MoviesSuggestionsRepository injectMoviesSuggestionsRepository(){
  return MoviesSuggestionsRepositoryImpl(moviesSuggestionsRemoteDataSource: injectMoviesSuggestionsRemoteDataSource());
}