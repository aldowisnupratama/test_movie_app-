import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/widgets/popular_movie_card.dart';

import '../../../../core/constant/constant.dart';
import '../bloc/movies_bloc.dart';

class PopularMovieGridView extends StatelessWidget {
  const PopularMovieGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final listOfPopular = state.listOfPopularMovie;
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.53,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: listOfPopular.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.read<MoviesBloc>().add(DoCheckFavoriteButtonStatus(
                        movieId: listOfPopular[index].id));
                    context
                        .read<MoviesBloc>()
                        .add(GetMovieDetailsEvent(id: listOfPopular[index].id));
                    Navigator.pushNamed(context, detail_page);
                  },
                  child: PopularMovieCard(movieEntity: listOfPopular[index]));
            });
      },
    );
  }
}
