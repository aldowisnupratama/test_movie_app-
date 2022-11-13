import 'package:flutter/foundation.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
            isFavorite: false,
            id: id,
            title: title,
            overview: overview,
            voteAverage: voteAverage,
            posterPath: posterPath,
            popularity: popularity,
            releaseDate: releaseDate);
  late final bool adult;
  late final String backdropPath;

  late final int budget;

  late final String homepage;
  late final int id;
  late final String imdbId;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;

  late final String releaseDate;
  late final int revenue;
  late final int runtime;

  late final String status;
  late final String tagline;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'] ?? -1,
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;

    _data['budget'] = budget;

    _data['homepage'] = homepage;
    _data['id'] = id;
    _data['imdb_id'] = imdbId;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;

    _data['release_date'] = releaseDate;
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;

    _data['status'] = status;
    _data['tagline'] = tagline;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
