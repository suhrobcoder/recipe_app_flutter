import 'package:recipe_app/util/contants.dart';

class OnboardingStep {
  final String title;
  final List<String> items;

  OnboardingStep(this.title, this.items);
}

const startingStep = 1;

final steps = [
  OnboardingStep("Do you follow any of these diets?", diets),
  OnboardingStep("Your favorite cuisines?", cuisines),
];
