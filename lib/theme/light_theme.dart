import 'package:flutter/material.dart';

class LightTheme {
  static Color backgroundColor = Color(0xffFFFFFF);
  static Color textColor = Color(0xff171717);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: backgroundColor,
      unselectedWidgetColor: textColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: backgroundColor,
        titleTextStyle: TextStyle(
            color: textColor, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      textTheme: TextTheme(
          titleSmall: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              color: backgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
              color: textColor, fontSize: 24, fontWeight: FontWeight.w500)));
}
