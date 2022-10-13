import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier{
  ThemeMode _themeMode=ThemeMode.light;
  get themeMode=>_themeMode;
  void changeTheme(ThemeMode themeMode){
    _themeMode=themeMode;
    notifyListeners();
  }
}