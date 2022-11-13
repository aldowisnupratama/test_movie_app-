import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:test_movie_app/features/tmbd_movie/data/tables/movie_table.dart';

abstract class LocalDataSources {
  Future<List<MovieTable>> getMovies();
  Future<void> addMovie(MovieTable movieTable);
  Future<void> deleteMovie(int movieId);
  Future<bool> isMovieExist(int movieId);
}

class LocalDataSourcesImpl extends LocalDataSources {
  final BOX_NAME = "movieBox";
  @override
  Future<List<MovieTable>> getMovies() async {
    final box = await Hive.openBox(BOX_NAME);
    final keys = box.keys;
    List<MovieTable> movies = [];
    keys.forEach((element) {
      final movie = box.get(element);
      if (movies != null) {
        movies.add(movie);
      }
    });
    return movies;
  }

  @override
  Future<void> addMovie(MovieTable movieTable) async {
    final box = await Hive.openBox(BOX_NAME);
    await box.put(movieTable.id, movieTable);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final box = await Hive.openBox(BOX_NAME);
    await box.delete(movieId);
  }

  @override
  Future<bool> isMovieExist(int movieId) async {
    final box = await Hive.openBox(BOX_NAME);
    final result = box.containsKey(movieId);
    log("ksdfnkasjndfkjasdf ini rsult ${result}");

    return box.containsKey(movieId);
  }
}
