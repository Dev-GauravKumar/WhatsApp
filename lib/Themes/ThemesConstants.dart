import 'package:flutter/material.dart';
ThemeData lightTheme=ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromRGBO(18,140,126,1),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: Color.fromRGBO(18,140,126,1),
  ),
);
ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
);