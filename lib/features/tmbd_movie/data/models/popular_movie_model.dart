import 'movie_model.dart';

class PopularMovieModel {
  PopularMovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<MovieModel> results;
  late final int totalPages;
  late final int totalResults;

  PopularMovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results =
        List.from(json['results']).map((e) => MovieModel.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
