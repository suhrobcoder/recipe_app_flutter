import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _darkThemeKey = "dark_theme";
const _firstRunKey = "first_run";

@singleton
class AppConfigPref {
  final SharedPreferences _sharedPreferences;

  AppConfigPref(this._sharedPreferences);

  bool isDarkTheme() => _sharedPreferences.getBool(_darkThemeKey) ?? false;

  Future<void> changeTheme(bool isDarkTheme) async {
    await _sharedPreferences.setBool(_darkThemeKey, isDarkTheme);
  }

  bool isFirstRun() => _sharedPreferences.getBool(_firstRunKey) ?? true;

  Future<void> setFirstRunFalse() async {
    await _sharedPreferences.setBool(_firstRunKey, false);
  }
}
