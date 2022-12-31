import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/pref/app_config_pref.dart';
import 'package:recipe_app/data/pref/settings_pref.dart';

@injectable
class SettingsRepository {
  final AppConfigPref appConfigPref;
  final SettingsPref settingsPref;

  SettingsRepository(this.appConfigPref, this.settingsPref);

  bool get isFirstRun => appConfigPref.isFirstRun();

  Future<void> setFirstRunFalse() => appConfigPref.setFirstRunFalse();

  bool get isDarkTheme => appConfigPref.isDarkTheme();

  Future<void> changeTheme(bool isDarkTheme) =>
      appConfigPref.changeTheme(isDarkTheme);

  List<String> get diets => settingsPref.getDiets();

  Future<void> setDiets(List<String> diets) => settingsPref.setDiets(diets);

  List<String> get cuisines => settingsPref.getCuisines();

  Future<void> setCuisines(List<String> cuisines) =>
      settingsPref.setCuisines(cuisines);
}
