import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/theme/app_theme.dart';

const _darkThemeKey = "dark_theme";
const _firstRunKey = "first_run";

class AppConfigService extends GetxService {
  late final GetStorage box;

  Future<AppConfigService> init() async {
    box = GetStorage("app_config");
    await box.writeIfNull(_darkThemeKey, false);
    Get.changeTheme(box.read(_darkThemeKey) ? darkTheme : lightTheme);
    return this;
  }

  bool getTheme() => box.read(_darkThemeKey);
  changeTheme(bool isDarkTheme) async {
    Get.changeTheme(isDarkTheme ? darkTheme : lightTheme);
    await box.write(_darkThemeKey, isDarkTheme);
  }

  bool isFirstRun() => box.read(_firstRunKey) ?? true;

  Future setFirstRunFalse() async {
    await box.write(_firstRunKey, false);
  }
}
