import 'package:flutter/material.dart';

import 'ify_custom_theme.dart';

class IFYTheme {
  static ThemeData get darktheme {
    return ThemeData(
      primaryColor: IFYColors.accentRed,
      scaffoldBackgroundColor: IFYColors.backgroundGrey,
      fontFamily: 'RobotoRegular',
      textTheme: const TextTheme(
        headline3: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white70),
        bodyText1: TextStyle(
          color: Color.fromRGBO(225, 29, 72, 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: IFYButtons.primaryButton
        )
      );
  }
}