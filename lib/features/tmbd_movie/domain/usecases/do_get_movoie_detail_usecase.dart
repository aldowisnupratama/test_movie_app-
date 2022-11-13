import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class DoGetMovieDetails extends Usecase<MovieDetailEntity, MovieDetailsParams> {
  final TMBDMoviesRepository tmbdMoviesRepository;

  DoGetMovieDetails(this.tmbdMoviesRepository);
  @override
  Future<Either<Failure, MovieDetailEntity>> call(MovieDetailsParams params) {
    return tmbdMoviesRepository.doGetMovieDetail(params.id);
  }
}

class MovieDetailsParams {
  final int id;

  MovieDetailsParams(this.id);
}
