import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class DoDeleteFavoriteMovie extends Usecase<void, int> {
  final TMBDMoviesRepository tmbdMoviesRepository;

  DoDeleteFavoriteMovie({required this.tmbdMoviesRepository});
  @override
  Future<Either<Failure, void>> call(int params) async {
    return await tmbdMoviesRepository.doDeleteFavoriteMovie(params);
  }
}
