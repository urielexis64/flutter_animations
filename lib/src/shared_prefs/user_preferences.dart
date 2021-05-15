import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get currentTheme {
    final theme = _prefs.getInt('theme') ?? 1;
    return theme;
  }

  set currentTheme(int theme) {
    _prefs.setInt('theme', theme);
  }
}
