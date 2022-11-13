import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_movie_app/core/constant/assets.dart';
import 'package:test_movie_app/core/constant/colors.dart';
import 'package:test_movie_app/core/constant/constant.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/bloc/movies_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    changePage();
    context.read<MoviesBloc>().add(GetPopularMovieEvent());

    super.initState();
  }

  void changePage() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, popular_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MovieAppColors.kBlackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assest.logo,
                width: Dimens.sun,
                height: Dimens.sun,
              ),
              SizedBox(
                height: Dimens.large,
              ),
              Text(
                "AIRPLANE CINEMA",
                style: MovieAppStyles.headlines[3]!.copyWith(letterSpacing: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
