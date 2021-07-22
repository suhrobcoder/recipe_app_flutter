import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const _darkThemeKey = "dark_theme";
const _firstRunKey = "first_run";

class AppConfigService extends GetxService {
  late GetStorage box;
  
  Future<AppConfigService> init() async {
    box = GetStorage("app_config");
    await box.writeIfNull(_darkThemeKey, false);
    await box.writeIfNull(_firstRunKey, true);
    Get.changeTheme(box.read(_darkThemeKey) ? ThemeData.dark() : ThemeData.light());
    return this;
  }
  
  bool getTheme() => box.read(_darkThemeKey);
  changeTheme(bool darkTheme) async {
    Get.changeTheme(darkTheme ? ThemeData.dark() : ThemeData.light());
    await box.write(_darkThemeKey, darkTheme);
  }

  bool isFirstRun() {
    bool res = box.read(_firstRunKey) ?? true;
    if (res) {
      box.write(_firstRunKey, false);
    }
    return res;
  }
}