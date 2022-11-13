part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> listOfPopularMovie;
  final List<MovieDetailEntity> listOfFavoriteMovie;
  final bool favoriteButtonStatus;
  final MovieDetailEntity movieDetailEntity;
  final bool getMovieDetailStatus;
  final bool onLoad;
  final bool onLoadFavorite;
  final bool getPopularMoviesStatus;

  const MoviesState(
      {required this.listOfPopularMovie,
      required this.onLoadFavorite,
      required this.listOfFavoriteMovie,
      required this.favoriteButtonStatus,
      required this.onLoad,
      required this.getMovieDetailStatus,
      required this.getPopularMoviesStatus,
      required this.movieDetailEntity});

  MoviesState copyWith(
      {List<MovieEntity>? listOfPopularMovie,
      List<MovieDetailEntity>? listOfFavoriteMovie,
      bool? favoriteButtonStatus,
      bool? onLoadFavorite,
      bool? getPopularMoviesStatus,
      bool? onLoad,
      MovieDetailEntity? movieDetailEntity,
      bool? getMovieDetailStatus}) {
    return MoviesState(
        onLoadFavorite: onLoadFavorite ?? this.onLoadFavorite,
        listOfFavoriteMovie: listOfFavoriteMovie ?? this.listOfFavoriteMovie,
        favoriteButtonStatus: favoriteButtonStatus ?? this.favoriteButtonStatus,
        onLoad: onLoad ?? this.onLoad,
        movieDetailEntity: movieDetailEntity ?? this.movieDetailEntity,
        getMovieDetailStatus: getMovieDetailStatus ?? this.getMovieDetailStatus,
        listOfPopularMovie: listOfPopularMovie ?? this.listOfPopularMovie,
        getPopularMoviesStatus:
            getPopularMoviesStatus ?? this.getPopularMoviesStatus);
  }

  @override
  List<Object> get props => [
        onLoad,
        listOfPopularMovie,
        getPopularMoviesStatus,
        movieDetailEntity,
        onLoadFavorite,
        getMovieDetailStatus,
        listOfFavoriteMovie,
        favoriteButtonStatus
      ];
}

class PopularMoviesInitial extends MoviesState {
  PopularMoviesInitial()
      : super(
            onLoadFavorite: false,
            favoriteButtonStatus: false,
            listOfFavoriteMovie: [],
            onLoad: false,
            listOfPopularMovie: [],
            getPopularMoviesStatus: true,
            getMovieDetailStatus: true,
            movieDetailEntity: MovieDetailEntity.empty());
}
