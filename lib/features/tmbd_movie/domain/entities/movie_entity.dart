import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double? voteAverage;

  MovieEntity(
      {required this.id,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      this.voteAverage});

  @override
  List<Object?> get props => [id, popularity, posterPath, releaseDate, title];

  @override
  bool? get stringify => true;
}
