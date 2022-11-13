import 'package:flutter/material.dart';
import 'package:test_movie_app/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/repository/tmbd_movies_repository.dart';

class DoCheckFavoriteMovis extends Usecase<bool, int> {
  final TMBDMoviesRepository tmbdMoviesRepository;

  DoCheckFavoriteMovis({required this.tmbdMoviesRepository});
  @override
  Future<Either<Failure, bool>> call(int params) async {
    return await tmbdMoviesRepository.doCheckMovieExistant(params);
  }
}
