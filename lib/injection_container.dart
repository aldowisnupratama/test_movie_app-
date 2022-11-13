import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_get_favorite_movie_usecase.dart';

import 'core/api/api_client.dart';
import 'features/tmbd_movie/data/datasources/local_datasources.dart';
import 'features/tmbd_movie/data/datasources/remote_datasources.dart';
import 'features/tmbd_movie/data/repositories/tmbd_movies_repository_impl.dart';
import 'features/tmbd_movie/domain/usecases/do_add_favorite_movie_usecase.dart';
import 'features/tmbd_movie/domain/usecases/do_check_favorite_movie_existance_usecase.dart';
import 'features/tmbd_movie/domain/usecases/do_delete_favorite_movie_usecase.dart';
import 'features/tmbd_movie/domain/usecases/do_get_movoie_detail_usecase.dart';
import 'features/tmbd_movie/domain/usecases/do_get_popular_movies_usecase.dart';
import 'features/tmbd_movie/presentation/bloc/movies_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => MoviesBloc(
        doGetFavoriteMovieUsecase: sl.get<DoGetFavoriteMovieUsecase>(),
        doCheckFavoriteMovis: sl.get<DoCheckFavoriteMovis>(),
        doAddFavoriteMovie: sl.get<DoAddFavoriteMovie>(),
        doGetPopularMoviesUsecase: sl.get<DoGetPopularMoviesUsecase>(),
        doGetMovieDetails: sl.get<DoGetMovieDetails>(),
        doDeleteFavoriteMovie: sl.get<DoDeleteFavoriteMovie>(),
      ));
  sl.registerLazySingleton(() => DoGetFavoriteMovieUsecase(
      tmbdMoviesRepository: sl.get<TMBDMoviesRepositoryImpl>()));
  sl.registerLazySingleton(() => DoCheckFavoriteMovis(
      tmbdMoviesRepository: sl.get<TMBDMoviesRepositoryImpl>()));

  sl.registerLazySingleton(() => DoDeleteFavoriteMovie(
      tmbdMoviesRepository: sl.get<TMBDMoviesRepositoryImpl>()));

  sl.registerLazySingleton(() => DoAddFavoriteMovie(
      tmbdMoviesRepository: sl.get<TMBDMoviesRepositoryImpl>()));
  sl.registerLazySingleton(
      () => DoGetMovieDetails(sl.get<TMBDMoviesRepositoryImpl>()));
  sl.registerLazySingleton(() => DoGetPopularMoviesUsecase(
      tmbdMoviesRepository: sl.get<TMBDMoviesRepositoryImpl>()));

  sl.registerLazySingleton(() => TMBDMoviesRepositoryImpl(
      localDataSources: sl.get<LocalDataSourcesImpl>(),
      remoteDataSource: sl.get<RemoteDataSourceImpl>()));

  sl.registerLazySingleton(() => LocalDataSourcesImpl());

  sl.registerLazySingleton(
      () => RemoteDataSourceImpl(apiClient: sl.get<APIClient>()));
  sl.registerLazySingleton(() => APIClient(sl.get<Client>()));
  sl.registerLazySingleton(() => Client());
}
