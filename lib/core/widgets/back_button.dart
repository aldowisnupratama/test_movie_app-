import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_movie_app/core/constant/assets.dart';

import '../constant/constant.dart';

class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: Dimens.medium, top: Dimens.tiny, bottom: Dimens.tiny),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: MovieAppColors.kWhiteColor, width: 1)),
        child: Center(
          child: IconButton(
              color: MovieAppColors.kWhiteColor,
              splashRadius: Dimens.large,
              iconSize: Dimens.medium,
              onPressed: () {
                onPressed();
              },
              icon: SvgPicture.asset(
                Assest.backIcon,
                color: MovieAppColors.kWhiteColor,
              )),
        ));
  }
}
