import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/data/services/app_config_service.dart';
import 'package:recipe_app/data/services/app_settings_service.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  Get.put(AppSettingsService());
  await Get.putAsync(() => AppConfigService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Text("Hello World"),
    );
  }
}
