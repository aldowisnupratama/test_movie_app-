import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_entity.dart';

import '../../../../core/constant/constant.dart';

class PopularMovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const PopularMovieCard({Key? key, required this.movieEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.canopus,
      height: Dimens.tripleUltraLarge,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "${APIConstants.BASE_IMAGE_URL}${movieEntity.posterPath}",
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: Dimens.megaLarge,
                        height: Dimens.large,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14)),
                            color: MovieAppColors.kWhiteColor),
                        child: Center(
                          child: Text(
                            "${movieEntity.voteAverage}",
                            style: MovieAppStyles.subtitle
                                .copyWith(color: MovieAppColors.kBlackColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: Dimens.tiny,
              ),
              Text(
                movieEntity.title,
                style: MovieAppStyles.titles[1],
              ),
              const SizedBox(
                height: Dimens.tiny,
              ),
              Text(
                movieEntity.releaseDate.split('-')[0],
                style: MovieAppStyles.subtitle,
              )
            ],
          )
        ],
      ),
    );
  }
}
