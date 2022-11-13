import 'package:flutter/material.dart';
import 'package:test_movie_app/core/api/api_client.dart';
import 'package:test_movie_app/core/constant/constant.dart';
import 'package:test_movie_app/features/tmbd_movie/data/models/movie_detail_model.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';

import '../models/movie_model.dart';
import '../models/popular_movie_model.dart';

abstract class RemoteDataSources {
  Future<List<MovieModel>> getPopularMovie();
  Future<MovieDetailModel> getMovieDetail(int id);
}

class RemoteDataSourceImpl extends RemoteDataSources {
  final APIClient apiClient;

  RemoteDataSourceImpl({required this.apiClient});
  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final result = await apiClient
        .get("/movie/popular", params: {"api_key": APIConstants.API_KEY});
    final movies = PopularMovieModel.fromJson(result).results;
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final result = await apiClient
        .get('/movie/$id', params: {"api_key": APIConstants.API_KEY});
    final moviedetailsmodel = MovieDetailModel.fromJson(result);
    return moviedetailsmodel;
  }
}
