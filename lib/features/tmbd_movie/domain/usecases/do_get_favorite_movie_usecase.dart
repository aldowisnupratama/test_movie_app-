import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class DoGetFavoriteMovieUsecase
    extends Usecase<List<MovieDetailEntity>, NoParams> {
  final TMBDMoviesRepository tmbdMoviesRepository;

  DoGetFavoriteMovieUsecase({required this.tmbdMoviesRepository});
  @override
  Future<Either<Failure, List<MovieDetailEntity>>> call(NoParams params) async {
    return await tmbdMoviesRepository.doGetFavoriteMovie();
  }
}
