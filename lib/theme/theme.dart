import 'package:custom_painter/src/shared_prefs/user_preferences.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeData _custom = ThemeData.dark().copyWith(
    accentColor: Color(0xff48a0eb),
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Color(0xff16202b),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
  );

  final prefs = UserPreferences();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = _custom;
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
      prefs.currentTheme = 2;
    } else {
      _currentTheme = ThemeData.light();
      prefs.currentTheme = 1;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = _custom;
      prefs.currentTheme = 3;
    } else {
      _currentTheme = ThemeData.light();
      prefs.currentTheme = 1;
    }

    notifyListeners();
  }
}
