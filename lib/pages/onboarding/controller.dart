import 'package:get/get.dart';
import 'package:recipe_app/data/services/app_config_service.dart';
import 'package:recipe_app/data/services/app_settings_service.dart';
import 'package:recipe_app/data/services/recipe_api_service.dart';
import 'package:recipe_app/pages/onboarding/onboarding_step.dart';
import 'package:recipe_app/routes/routes.dart';

const _startingStep = 1;

final steps = [
  OnboardingStep("Do you follow any of these diets?", diets),
  OnboardingStep("Your favorite cuisines?", cuisines),
];

class OnboardingController extends GetxController {
  final AppSettingsService _settings;

  OnboardingController(this._settings);

  var step = _startingStep.obs;
  var currentStep = steps[_startingStep - 1].obs;

  var selectedCuisines = <String>[].obs;
  var selectedDiets = <String>[].obs;

  void nextStep() {
    if (step.value == steps.length) {
      saveResults();
    } else {
      step++;
      currentStep.value = steps[step.value - 1];
    }
  }

  void prevStep() {
    if (step > 1) {
      step--;
      currentStep.value = steps[step.value - 1];
    }
  }

  void saveResults() async {
    await _settings.setDiets(selectedDiets);
    await _settings.setCuisines(selectedCuisines);
    navigateToHomePage();
  }

  void skip() {
    navigateToHomePage();
  }

  void navigateToHomePage() async {
    await Get.find<AppConfigService>().setFirstRunFalse();
    Get.offNamed(Routes.home);
  }

  void selectItem(String item) {
    if (step.value == 1) {
      if (selectedCuisines.contains(item)) {
        selectedCuisines.remove(item);
      } else {
        selectedCuisines.add(item);
      }
    } else if (step.value == 2) {
      if (selectedDiets.contains(item)) {
        selectedDiets.remove(item);
      } else {
        selectedDiets.add(item);
      }
    }
  }
}
