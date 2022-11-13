import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final bool isFavorite;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double? voteAverage;
  final String overview;

  MovieDetailEntity(
      {required this.id,
      required this.isFavorite,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      this.voteAverage,
      required this.overview});

  MovieDetailEntity copyWith(
      {double? popularity,
      String? posterPath,
      String? releaseDate,
      bool? isFavorite,
      String? title,
      double? voteAverage,
      String? overview}) {
    return MovieDetailEntity(
        id: id,
        isFavorite: isFavorite ?? this.isFavorite,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        overview: overview ?? this.overview);
  }

  MovieDetailEntity.empty()
      : this(
            isFavorite: false,
            id: -99,
            posterPath: '',
            popularity: 0.0,
            voteAverage: 0.0,
            title: '',
            overview: '',
            releaseDate: '');

  @override
  List<Object?> get props =>
      [id, popularity, posterPath, releaseDate, title, voteAverage, overview];
}
