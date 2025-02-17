import 'package:flutter/material.dart';

class DarkTheme {
  static Color backgroundColor = Color(0xff171717);
  static Color textColor = Color(0xffFFFFFF);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      unselectedWidgetColor: textColor,
      primaryColor: backgroundColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: textColor, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      textTheme: TextTheme(
          titleSmall: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700
          ),
          titleMedium: TextStyle(
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.w500
          )
      )
  );
}
