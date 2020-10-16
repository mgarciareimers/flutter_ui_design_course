import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = new Preferences._internal();

  static const String THEME = 'theme';

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  SharedPreferences _sharedPreferences;

  initPreferences() async {
    this._sharedPreferences = await SharedPreferences.getInstance();
  }

  // Theme id.
  int get theme => this._sharedPreferences.get(THEME) == null ? 1 : this._sharedPreferences.get(THEME);
  set theme (int theme) => this._sharedPreferences.setInt(THEME, theme);
}