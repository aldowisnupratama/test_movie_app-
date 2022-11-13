import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_movie_app/core/usecase/usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_add_favorite_movie_usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_check_favorite_movie_existance_usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_delete_favorite_movie_usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_get_favorite_movie_usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_get_movoie_detail_usecase.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/usecases/do_get_popular_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final DoGetPopularMoviesUsecase doGetPopularMoviesUsecase;
  final DoGetMovieDetails doGetMovieDetails;
  final DoAddFavoriteMovie doAddFavoriteMovie;
  final DoDeleteFavoriteMovie doDeleteFavoriteMovie;
  final DoGetFavoriteMovieUsecase doGetFavoriteMovieUsecase;
  final DoCheckFavoriteMovis doCheckFavoriteMovis;
  MoviesBloc(
      {required this.doGetPopularMoviesUsecase,
      required this.doAddFavoriteMovie,
      required this.doGetFavoriteMovieUsecase,
      required this.doCheckFavoriteMovis,
      required this.doDeleteFavoriteMovie,
      required this.doGetMovieDetails})
      : super(PopularMoviesInitial()) {
    on<MoviesEvent>((event, emit) async {
      if (event is GetPopularMovieEvent) {
        await getPopularMovie(event, emit);
      }
      if (event is GetMovieDetailsEvent) {
        await getMovieDetailsEvent(event, emit);
      }
      if (event is DoAddFavoriteMovieEvent) {
        await addFavoriteMovie(event, emit);
      }
      if (event is DoDeleteFavorieMovieEvent) {
        await deleteFavoriteMovie(event, emit);
      }
      if (event is DoCheckFavoriteButtonStatus) {
        await doCheckFavoriteMovies(event, emit);
      }
      if (event is DoGetAllFavoriteMovie) {
        await doGetAllFavoriteMovie(event, emit);
      }
    });
  }

  Future<void> getPopularMovie(
      GetPopularMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await doGetPopularMoviesUsecase(NoParams());
    result.fold((l) {
      emit(state.copyWith(getPopularMoviesStatus: false));
    }, (r) {
      emit(state.copyWith(listOfPopularMovie: r));
    });
  }

  Future<void> getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(onLoad: true));
    final result = await doGetMovieDetails(MovieDetailsParams(event.id));

    result.fold((l) {
      emit(state.copyWith(getMovieDetailStatus: false, onLoad: false));
    }, (r) {
      emit(state.copyWith(movieDetailEntity: r, onLoad: false));
    });
  }

  Future<void> addFavoriteMovie(
      DoAddFavoriteMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await doAddFavoriteMovie(event.movieDetailEntity);
    result.fold((l) {}, (r) => {});
  }

  Future<void> deleteFavoriteMovie(
      DoDeleteFavorieMovieEvent event, Emitter<MoviesState> emit) async {
    final result = await doDeleteFavoriteMovie(event.movieId);
  }

  Future<void> doCheckFavoriteMovies(
      DoCheckFavoriteButtonStatus event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(onLoadFavorite: true));
    log("===================== id ${event.movieId}");
    final result = await doCheckFavoriteMovis(event.movieId);
    result.fold((l) {
      log("this is l : ${l}");
      emit(state.copyWith(
        favoriteButtonStatus: false,
        onLoadFavorite: false,
      ));
    }, (r) {
      log(" this is r ${r}");
      emit(state.copyWith(
        onLoadFavorite: false,
        favoriteButtonStatus: r,
      ));
    });
  }

  Future<void> doGetAllFavoriteMovie(
      DoGetAllFavoriteMovie event, Emitter<MoviesState> emit) async {
    final result = await doGetFavoriteMovieUsecase(NoParams());
    result.fold((l) {
      emit(state.copyWith(listOfFavoriteMovie: []));
    }, (r) {
      emit(state.copyWith(listOfFavoriteMovie: r));
    });
  }
}
