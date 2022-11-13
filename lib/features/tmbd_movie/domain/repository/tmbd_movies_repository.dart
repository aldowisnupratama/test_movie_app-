import 'package:dartz/dartz.dart';
import 'package:test_movie_app/features/tmbd_movie/data/models/movie_detail_model.dart';
import 'package:test_movie_app/features/tmbd_movie/data/tables/movie_table.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';

import '../../../../core/error/failures/failure.dart';
import '../entities/movie_entity.dart';

abstract class TMBDMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> doGetPopularMovies();
  Future<Either<Failure, MovieDetailEntity>> doGetMovieDetail(int id);
  Future<Either<Failure, List<MovieDetailEntity>>> doGetFavoriteMovie();
  Future<Either<Failure, void>> doAddFavoriteMovie(
      MovieDetailEntity movieDetailEntity);
  Future<Either<Failure, void>> doDeleteFavoriteMovie(int id);
  Future<Either<Failure, bool>> doCheckMovieExistant(int id);
}
