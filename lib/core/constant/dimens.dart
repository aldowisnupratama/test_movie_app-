import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimens {
  Dimens._();

  /// `0.0` px
  static const double zero = 0.0;

  /// 5XS `1.0` px
  static const double quarks = 1.0;

  /// 4XS `2.0` px
  static const double neutron = 2.0;

  /// 3XS `4.0` px
  static const double atom = 4.0;

  /// 2XS `6.0` px
  static const double veryTiny = 6.0;

  /// XS `8.0` px
  static const double tiny = 2 * atom;

  /// Tiny++ 10.0 px
  static const double largeTiny = 2.5 * atom;

  /// S `12.0` px
  static const double small = 3 * atom;

  /// MS `14.0` px
  static const double megaSmall = 3.5 * atom;

  /// M `16.0` px
  static const double medium = 4 * atom;

  /// M `18.0` px
  static const double extraMedium = 4.5 * atom;

  /// M `20.0` px
  static const double superMedium = 5 * atom;

  /// L `24.0` px
  static const double large = 6 * atom;

  /// XL `32.0` px
  static const double extraLarge = 8 * atom;

  /// 2XL `40.0` px
  static const double superLarge = 10 * atom;

  /// 3XL `48.0` px
  static const double megaLarge = 12 * atom;

  /// 4XL `60.0` px
  static const double ultraLarge = 15 * atom;

  /// 5XL `64.0` px
  static const double doubleUltraLarge = 16 * atom;

  /// 6XL `72.0` px
  static const double tripleUltraLarge = 18 * atom;

  /// 7XL `80.0` px
  static const double quadrupleUltraLarge = 20 * atom;

  /// 8XL `100.0` px
  static const double proximaCentauri = 100;

  /// 9XL `120.0` px
  static const double sun = 120;

  /// 10XL `140.0` px
  static const double blueGiant = 140;

  /// 11XL `160.0` px
  static const double canopus = 160;

  // best scenario for trigger scroll offset top
  static const double navOffsetTopTrigger = 250;

  ///Thumbnail size `80` px but it may change later
  static int thumbnail = quadrupleUltraLarge.toInt();

  static const double navBarAppLogoWidth = 40;


  /// Full width of screen
  static double width = Get.width;

  /// Full height of screen
  static double height = Get.height;

  /// Grid ratio
  static double get gridRation {
    final double itemHeight = (Dimens.height - kToolbarHeight - large) / 3.4;
    final double itemWidth = Dimens.width / 2;
    return itemWidth / itemHeight;
  }

  static const Size appBarSize = Size.fromHeight(kToolbarHeight);

  static double get imageMessage => width * 0.65;

  static double get normalLineHeight => 1.3;
}