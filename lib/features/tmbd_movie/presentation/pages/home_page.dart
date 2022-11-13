import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/bloc/movies_bloc.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/widgets/popular_movie_grid_view.dart';

import '../../../../core/constant/constant.dart';
import '../widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  final PanelController panelController = PanelController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: PopularAppBar(
                panelController: panelController,
              ),
            ),
            backgroundColor: MovieAppColors.kBlackColor,
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: Dimens.medium,
                ),
                Text(
                  "Current Popular Movies",
                  style: MovieAppStyles.titles[3],
                ),
                const SizedBox(
                  height: Dimens.large,
                ),
                PopularMovieGridView()
              ],
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            backdropTapClosesPanel: true,
            controller: panelController,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            minHeight: 0,
            maxHeight: 550,
            color: MovieAppColors.kBlackColor.withOpacity(.9),
            panel: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: Dimens.medium,
                ),
                Text(
                  "Your Favorite Movie(s)",
                  style: MovieAppStyles.titles[1],
                ),
                BlocBuilder<MoviesBloc, MoviesState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    final favorites = state.listOfFavoriteMovie;
                    if (favorites.isEmpty) {
                      return SizedBox();
                    }
                    return Flexible(
                        child: ListView.builder(
                            padding:
                                EdgeInsets.only(top: 0, bottom: Dimens.medium),
                            itemCount: favorites.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  context.read<MoviesBloc>().add(
                                      DoCheckFavoriteButtonStatus(
                                          movieId: favorites[index].id));
                                  context.read<MoviesBloc>().add(
                                      GetMovieDetailsEvent(
                                          id: favorites[index].id));
                                  Navigator.pushNamed(context, detail_page);

                                  panelController.close();
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Dimens.medium,
                                    vertical: Dimens.atom),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: Dimens.megaLarge,
                                      height: Dimens.megaLarge,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500${favorites[index].posterPath}'),
                                ),
                                title: Text(
                                  "${favorites[index].title}",
                                  style: MovieAppStyles.titles[1],
                                ),
                                subtitle: Text(
                                  "${favorites[index].releaseDate}",
                                  style: MovieAppStyles.subtitle,
                                ),
                              );
                            }));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
