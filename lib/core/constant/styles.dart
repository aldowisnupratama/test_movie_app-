import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_movie_app/core/constant/constant.dart';

import 'colors.dart';

class MovieAppStyles {
  MovieAppStyles._();

  static TextStyle defaultStyle = GoogleFonts.poppins(
      color: MovieAppColors.kWhiteColor, fontSize: 12, height: 1.0);

  static TextStyle bold = defaultStyle.copyWith(fontWeight: FontWeight.w700);
  static TextStyle medium = defaultStyle.copyWith(fontWeight: FontWeight.w500);
  static TextStyle normal = defaultStyle.copyWith(fontWeight: FontWeight.w400);

  // H1 - H4
  static Map<int, TextStyle> headlines = {
    1: bold.copyWith(fontSize: 30),
    2: bold.copyWith(fontSize: 24),
    3: bold.copyWith(fontSize: 20),
    4: medium.copyWith(fontSize: 18)
  };

  // subheaders/sub heading 1 & 2
  static Map<int, TextStyle> subHeaders = {
    1: defaultStyle.copyWith(fontSize: 15),
    2: medium.copyWith(fontSize: 16),
    3: medium.copyWith(fontSize: 15)
  };

  static Map<int, TextStyle> titles = {
    1: bold.copyWith(fontSize: 16),
    2: medium.copyWith(fontSize: 16),
    3: defaultStyle.copyWith(fontSize: 16)
  };

  static TextStyle subtitle = defaultStyle.copyWith(fontSize: 14);

  static Map<int, TextStyle> body = {
    1: medium.copyWith(fontSize: 14),
    2: defaultStyle.copyWith(
        fontSize: 13), // 3: => default style are 12px so use defaultStyle
    3: normal.copyWith(fontSize: 14)
  };

  static TextStyle caption = defaultStyle.copyWith(fontSize: 10);

  static Map<int, TextStyle> buttonText = {
    1: medium.copyWith(fontSize: 16),
    2: medium.copyWith(fontSize: 15)
  };

  static Map<int, TextStyle> italicTexts = {
    1: GoogleFonts.dancingScript().copyWith(
        fontSize: 30,
        fontStyle: FontStyle.italic,
        color: MovieAppColors.kWhiteColor),
    2: GoogleFonts.dancingScript()
        .copyWith(fontSize: 12, fontStyle: FontStyle.italic)
  };

  static TextStyle inputField = defaultStyle.copyWith(
    // color: const Color(0xFF1D1D1D),
    fontSize: 16,
    height: 1.25,
    fontStyle: FontStyle.normal,
  );
}
