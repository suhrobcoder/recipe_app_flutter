import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const _dietsKey = "diets";
const _cuisinesKey = "cuisines";

class AppSettingsService extends GetxService {
  GetStorage box = GetStorage("settings");

  setDiets(List<String> diets) async {
    await box.write(_dietsKey, diets.join("|"));
  }

  setCuisines(List<String> cuisines) async {
    await box.write(_cuisinesKey, cuisines.join("|"));
  }

  List<String> getDiets() {
    return (box.read(_dietsKey) ?? "").split("|");
  }

  List<String> getCuisines() {
    return (box.read(_cuisinesKey) ?? "").split("|");
  }
}
