import 'package:hive/hive.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
part 'movie_table.g.dart';

@HiveType(typeId: 1, adapterName: "MovieAdapter")
class MovieTable extends MovieDetailEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final bool isFavorite;
  @HiveField(2)
  final double popularity;
  @HiveField(3)
  final String posterPath;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final String title;
  @HiveField(6)
  final double? voteAverage;
  @HiveField(7)
  final String overview;

  MovieTable(
      {required this.id,
      required this.isFavorite,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      this.voteAverage,
      required this.overview})
      : super(
            id: id,
            isFavorite: isFavorite,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            voteAverage: voteAverage,
            overview: overview);

  factory MovieTable.fromMovieDetailEntity(
      MovieDetailEntity movieDetailEntity) {
    return MovieTable(
        id: movieDetailEntity.id,
        isFavorite: movieDetailEntity.isFavorite,
        popularity: movieDetailEntity.popularity,
        posterPath: movieDetailEntity.posterPath,
        releaseDate: movieDetailEntity.releaseDate,
        title: movieDetailEntity.title,
        overview: movieDetailEntity.overview);
  }
}
