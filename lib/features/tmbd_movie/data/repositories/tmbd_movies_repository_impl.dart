import 'package:get/get_connect.dart';
import 'package:test_movie_app/core/error/failures/database_failure.dart';
import 'package:test_movie_app/core/error/failures/server_failure.dart';
import 'package:test_movie_app/features/tmbd_movie/data/datasources/local_datasources.dart';
import 'package:test_movie_app/features/tmbd_movie/data/datasources/remote_datasources.dart';
import 'package:test_movie_app/features/tmbd_movie/data/tables/movie_table.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_entity.dart';
import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class TMBDMoviesRepositoryImpl extends TMBDMoviesRepository {
  final RemoteDataSources remoteDataSource;
  final LocalDataSources localDataSources;

  TMBDMoviesRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSources});
  @override
  Future<Either<Failure, List<MovieEntity>>> doGetPopularMovies() async {
    try {
      final movies = await remoteDataSource.getPopularMovie();
      return Right(movies);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> doGetMovieDetail(int id) async {
    try {
      final moviemodeldetail = await remoteDataSource.getMovieDetail(id);
      return Right(moviemodeldetail);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> doAddFavoriteMovie(
      MovieDetailEntity movieDetailEntity) async {
    try {
      final result = await localDataSources
          .addMovie(MovieTable.fromMovieDetailEntity(movieDetailEntity));
      return Right(result);
    } on Exception {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> doCheckMovieExistant(int id) async {
    try {
      final response = await localDataSources.isMovieExist(id);
      return Right(response);
    } on Exception {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> doDeleteFavoriteMovie(int id) async {
    try {
      final response = await localDataSources.deleteMovie(id);
      return Right(response);
    } on Exception {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieDetailEntity>>> doGetFavoriteMovie() async {
    try {
      final response = await localDataSources.getMovies();
      return Right(response);
    } on Exception {
      return Left(DatabaseFailure());
    }
  }
}
