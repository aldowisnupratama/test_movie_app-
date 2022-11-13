import 'dart:developer';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/bloc/movies_bloc.dart';
import '../../../../core/constant/constant.dart';
import '../widgets/details_appbar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget posterImage(MovieDetailEntity movieDetailEntity) {
      return Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MovieAppColors.kBlackColor.withOpacity(0.3),
                MovieAppColors.kBlackColor
              ],
            ),
          ),
          width: double.infinity,
          height: 500,
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl:
                  'https://image.tmdb.org/t/p/w500${movieDetailEntity.posterPath}')
          //   imageUrl:
          //       '${APIConstants.BASE_IMAGE_URL}${movieDetailEntity.posterPath}',
          // )
          );
    }

    Widget header(MovieDetailEntity movieDetailEntity) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${movieDetailEntity.title} (${movieDetailEntity.voteAverage!.round()})",
              style: MovieAppStyles.titles[1],
            ),
            SizedBox(
              height: Dimens.tiny,
            ),
            Text(
              "${movieDetailEntity.releaseDate}",
              style: MovieAppStyles.subtitle,
            )
          ],
        ),
      );
    }

    Widget content(MovieDetailEntity movieDetailEntity) {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.superMedium, vertical: Dimens.medium),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MovieAppColors.kWhiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimens.small,
            ),
            Text(
              "Overview",
              style: MovieAppStyles.titles[1]!
                  .copyWith(color: MovieAppColors.kBlackColor),
            ),
            SizedBox(
              height: Dimens.medium,
            ),
            Text(
              "${movieDetailEntity.overview}",
              style: MovieAppStyles.subtitle
                  .copyWith(color: MovieAppColors.kBlackColor),
            ),
            SizedBox(
              height: Dimens.medium,
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: MovieAppColors.kBlackColor,
        body: BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state.onLoad) {
              return SafeArea(
                child: Shimmer.fromColors(
                    baseColor: MovieAppColors.kBlackColor,
                    highlightColor: MovieAppColors.kGreyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          width: Dimens.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: MovieAppColors.kGreenColor),
                        ),
                        SizedBox(
                          height: Dimens.medium,
                        ),
                        Container(
                          height: Dimens.height / 2,
                          width: Dimens.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: MovieAppColors.kGreenColor),
                        ),
                      ],
                    )),
              );
            }

            log(state.movieDetailEntity.posterPath);
            return SizedBox(
              height: Dimens.height,
              width: double.infinity,
              child: Stack(
                children: [
                  posterImage(state.movieDetailEntity),
                  Positioned(top: 380, child: header(state.movieDetailEntity)),
                  Positioned(
                      top: 430,
                      left: Dimens.extraMedium,
                      right: Dimens.extraMedium,
                      child: content(state.movieDetailEntity)),
                  Positioned.fill(
                      child: DetailsAppBar(
                    movieDetailEntity: state.movieDetailEntity,
                  ))
                ],
              ),
            );
          },
        ));
  }
}
