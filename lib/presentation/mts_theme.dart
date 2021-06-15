import 'package:flutter/material.dart';

import '../constants/enums.dart';

abstract class MTStheme {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.indigo;

  static Color primaryTextColor = Colors.grey.shade800;
  static const Color secondaryTextColor = Colors.white;

  static const Color cardColor = Colors.white;
  static const Color canvasColor = Colors.white;
  static const Color dividerColor = Colors.grey;

  static const Color errorColor = Colors.red;
  static Color hintColor = primaryTextColor;
  static const Color successColor = Colors.green;

  static const Color darkOrchid = Color(0xFF9C27B0);

  /// Custom ThemeData Colors
  static const List<Color> primaryGradientColors = [Color(0xFFB620E0), Color(0xFFEED810)];

  static TextTheme customSmallTextTheme = TextTheme(
    headline1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 40),
    headline2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 36),
    headline3: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 32),
    headline4: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 28),
    headline5: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 26),
    headline6: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 24),
    subtitle1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 20),
    subtitle2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 18),
    bodyText1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 16),
    bodyText2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 14),
    button: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w600, fontSize: 12),
    caption: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w400, fontSize: 10),
    overline: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w400, fontSize: 8),
  );

  static TextTheme customMediumTextTheme = TextTheme(
    headline1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 48),
    headline2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 44),
    headline3: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 38),
    headline4: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 36),
    headline5: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 32),
    headline6: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 28),
    subtitle1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w600, fontSize: 24),
    subtitle2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 22),
    bodyText1: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 20),
    bodyText2: TextStyle(color: primaryTextColor, fontWeight: FontWeight.w400, fontSize: 16),
    button: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w600, fontSize: 14),
    caption: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w400, fontSize: 12),
    overline: TextStyle(color: secondaryTextColor, fontWeight: FontWeight.w400, fontSize: 10),
  );

  static TextTheme customLargeTextTheme = customMediumTextTheme;

  static ThemeData customThemeData(DeviceScreenSize screenSize) {
    TextTheme _textTheme = customSmallTextTheme;

    switch (screenSize) {
      case DeviceScreenSize.Small:
        _textTheme = customSmallTextTheme;
        break;
      case DeviceScreenSize.Medium:
        _textTheme = customMediumTextTheme;
        break;
      case DeviceScreenSize.Large:
        _textTheme = customLargeTextTheme;
        break;
    }

    return ThemeData(
      hintColor: hintColor,
      textTheme: _textTheme,
      errorColor: errorColor,
      canvasColor: canvasColor,
      accentColor: accentColor,
      buttonColor: primaryColor,
      primaryColor: primaryColor,
      dividerColor: dividerColor,
      cardColor: cardColor,
      fontFamily: 'AvenirNextRounded',
      indicatorColor: primaryTextColor,
      scaffoldBackgroundColor: canvasColor,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
      ),
      sliderTheme: SliderThemeData(
        trackHeight: 8,
        valueIndicatorColor: primaryColor,
        tickMarkShape: SliderTickMarkShape.noTickMark,
        valueIndicatorTextStyle: _textTheme.overline?.apply(color: Colors.white),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),
    );
  }
}
