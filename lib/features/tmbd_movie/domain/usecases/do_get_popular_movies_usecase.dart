import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class DoGetPopularMoviesUsecase extends Usecase<List<MovieEntity>, NoParams> {
  final TMBDMoviesRepository tmbdMoviesRepository;

  DoGetPopularMoviesUsecase({required this.tmbdMoviesRepository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return tmbdMoviesRepository.doGetPopularMovies();
  }
}
