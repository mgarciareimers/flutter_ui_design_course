import 'package:flutter/material.dart';

// Preferences.
import 'package:backgrounds_design/src/preferences/preferences.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  static const int THEME_LIGHT = 1;
  static const int THEME_DARK = 2;
  static const int THEME_CUSTOM = 3;

  Preferences _preferences = new Preferences();

  ThemeChanger(int theme) {
    switch(theme) {
      case THEME_LIGHT:
        this._darkTheme = false;
        this._customTheme = false;
        this._currentTheme = ThemeData.light();
        break;
      case THEME_DARK:
        this._darkTheme = true;
        this._customTheme = false;
        this._currentTheme = ThemeData.dark();
        break;
      case THEME_CUSTOM:
        this._darkTheme = false;
        this._customTheme = true;
        this._currentTheme = ThemeData.light();
        break;
      default: break;
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;

    this._currentTheme = value ? ThemeData.dark() : ThemeData.light();

    this._preferences.theme = value ? THEME_DARK : THEME_LIGHT;

    notifyListeners();
  }

  set customTheme(bool value) {
    this._darkTheme = false;
    this._customTheme = value;

    if (value) {
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0Eb),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      );
    } else {
      this._currentTheme = ThemeData.light();
    }

    this._preferences.theme = value ? THEME_CUSTOM : THEME_LIGHT;

    notifyListeners();
  }
}