import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _dietsKey = "diets";
const _cuisinesKey = "cuisines";

@singleton
class SettingsPref {
  final SharedPreferences _sharedPreferences;

  SettingsPref(this._sharedPreferences);

  List<String> getDiets() => _sharedPreferences.getStringList(_dietsKey) ?? [];

  Future<void> setDiets(List<String> diets) =>
      _sharedPreferences.setStringList(_dietsKey, diets);

  List<String> getCuisines() =>
      _sharedPreferences.getStringList(_cuisinesKey) ?? [];

  Future<void> setCuisines(List<String> cuisines) =>
      _sharedPreferences.setStringList(_cuisinesKey, cuisines);
}
