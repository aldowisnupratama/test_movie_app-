import 'package:flutter/material.dart';
import 'package:test_movie_app/core/constant/path.dart';
import 'package:test_movie_app/core/pages/splash_page.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/pages/details_page.dart';
import 'package:test_movie_app/features/tmbd_movie/presentation/pages/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash_page:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case popular_page:
        return MaterialPageRoute(builder: (_) => HomePage());
      case detail_page:
        return MaterialPageRoute(builder: (_) => DetailsPage());
      default:
        return null;
    }
  }
}
