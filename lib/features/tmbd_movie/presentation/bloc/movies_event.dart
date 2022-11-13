part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovieEvent extends MoviesEvent {}

class GetMovieDetailsEvent extends MoviesEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});
}

class DoAddFavoriteMovieEvent extends MoviesEvent {
  final MovieDetailEntity movieDetailEntity;

  DoAddFavoriteMovieEvent({required this.movieDetailEntity});
}

class DoDeleteFavorieMovieEvent extends MoviesEvent {
  final int movieId;

  const DoDeleteFavorieMovieEvent({required this.movieId});
}

class DoGetAllFavoriteMovie extends MoviesEvent {}

class DoCheckFavoriteButtonStatus extends MoviesEvent {
  final int movieId;

  DoCheckFavoriteButtonStatus({required this.movieId});
}
