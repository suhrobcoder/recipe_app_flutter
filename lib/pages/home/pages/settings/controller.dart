import 'package:get/get.dart';
import 'package:recipe_app/data/services/app_config_service.dart';

class SettingsPageController extends GetxController {
  final AppConfigService configService;

  var isNightTheme = false.obs;
  SettingsPageController({required this.configService});

  @override
  void onInit() {
    isNightTheme.value = configService.getTheme();
    super.onInit();
  }

  void changeTheme() async {
    await configService.changeTheme(!isNightTheme.value);
    isNightTheme.value = configService.getTheme();
  }
}
