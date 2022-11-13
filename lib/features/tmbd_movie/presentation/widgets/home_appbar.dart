import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/bloc/movies_bloc.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/constant.dart';

class PopularAppBar extends StatelessWidget {
  final PanelController panelController;
  const PopularAppBar({Key? key, required this.panelController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: MovieAppColors.kTransparentColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        elevation: 0.5,
        backgroundColor: MovieAppColors.kBlackColor,
        centerTitle: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
            child: Center(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assest.logo,
                        width: Dimens.large,
                        height: Dimens.large,
                      ),
                      SizedBox(
                        width: Dimens.tiny,
                      ),
                      Text(
                        "Cinema",
                        style: MovieAppStyles.italicTexts[1],
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      context.read<MoviesBloc>().add(DoGetAllFavoriteMovie());
                      panelController.open();
                    },
                    child: Text(
                      "FAV",
                      style: MovieAppStyles.titles[3],
                    ))
              ]),
            ),
          ),
        ));
  }
}
