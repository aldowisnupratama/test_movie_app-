import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_movie_app/features/tmbd_movie/domain/entities/movie_detail_entity.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/bloc/movies_bloc.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/constant.dart';

class DetailsAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const DetailsAppBar({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(Dimens.tiny),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: MovieAppColors.kWhiteColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset(
                    Assest.backIcon,
                    color: MovieAppColors.kWhiteColor,
                  ),
                ),
              ),
              BlocBuilder<MoviesBloc, MoviesState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state.onLoadFavorite == true) {
                    return SizedBox();
                  }
                  return state.favoriteButtonStatus
                      ? IconButton(
                          iconSize: Dimens.extraLarge,
                          onPressed: () {
                            context.read<MoviesBloc>().add(
                                DoCheckFavoriteButtonStatus(
                                    movieId: movieDetailEntity.id));
                            context.read<MoviesBloc>().add(
                                DoDeleteFavorieMovieEvent(
                                    movieId: movieDetailEntity.id));
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: MovieAppColors.kWhiteColor,
                          ))
                      : IconButton(
                          iconSize: Dimens.extraLarge,
                          onPressed: () {
                            context.read<MoviesBloc>().add(
                                DoCheckFavoriteButtonStatus(
                                    movieId: movieDetailEntity.id));
                            context.read<MoviesBloc>().add(
                                DoAddFavoriteMovieEvent(
                                    movieDetailEntity: movieDetailEntity));
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            color: MovieAppColors.kWhiteColor,
                          ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
