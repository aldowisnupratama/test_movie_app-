import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;

  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel(
      {required this.adult,
      this.backdropPath,
      this.genreIds,
      required this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      this.video,
      this.voteAverage,
      required this.voteCount})
      : super(
            id: id,
            releaseDate: releaseDate,
            popularity: popularity,
            voteAverage: voteAverage,
            posterPath: posterPath,
            title: title);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'] ?? '',
      id: json['id'] ?? -1,
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'] ?? '',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }
}
