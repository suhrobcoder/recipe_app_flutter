import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/pages/home/pages/settings/controller.dart';
import 'package:recipe_app/theme/constantas.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final controller = Get.find<SettingsPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SettingsList(
        contentPadding: const EdgeInsets.only(top: defaultPadding),
        lightBackgroundColor: Colors.transparent,
        sections: [
          SettingsSection(
            title: "Theme",
            tiles: [
              SettingsTile.switchTile(
                title: "Night theme",
                onToggle: (value) => controller.changeTheme(),
                switchValue: controller.isNightTheme.value,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsAppBar extends AppBar {
  SettingsAppBar({Key? key})
      : super(
          key: key,
          title: const Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        );
}
