import 'package:movie/api/api_manger.dart';
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
