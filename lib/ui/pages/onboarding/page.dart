import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/ui/pages/onboarding/controller.dart';
import 'package:recipe_app/ui/pages/onboarding/onboarding_step.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';
import 'package:recipe_app/ui/theme/constants.dart';

import '../../components/recipe_chip.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        title: Obx(
          () => Row(
            children: List.generate(
              steps.length,
              (index) => OnboardingStepItem(index + 1,
                  index == Get.find<OnboardingController>().step.value - 1),
            ),
          ),
        ),
        actions: [
          Container(
            height: 48.0,
            padding: EdgeInsets.only(right: defaultPadding),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: TextButton(
              onPressed: () {
                Get.find<OnboardingController>().skip();
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                  Get.find<OnboardingController>().currentStep.value.title,
                  style: Theme.of(context).textTheme.headline4),
            ),
            Text(
              "To offer you the best recipes we need to know your some information",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: defaultPadding),
            Obx(
              () {
                OnboardingController controller = Get.find();
                OnboardingStep currentStep = controller.currentStep.value;
                List<String> selectedItems = controller.step.value == 1
                    ? controller.selectedCuisines
                    : controller.selectedDiets;
                return Expanded(
                  child: Wrap(
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: currentStep.items
                        .map(
                          (step) => RecipeChip(
                            step,
                            selectedItems.contains(step),
                            () {
                              controller.selectItem(step);
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
            Row(
              children: [
                Obx(() {
                  bool visible = Get.find<OnboardingController>().step > 1;
                  return AnimatedSize(
                    duration: const Duration(milliseconds: defualtAnimDuration),
                    child: visible
                        ? PreviousButton(
                            () {
                              Get.find<OnboardingController>().prevStep();
                            },
                          )
                        : SizedBox(width: 0),
                  );
                }),
                Spacer(),
                NextStepButton(
                  () {
                    Get.find<OnboardingController>().nextStep();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingStepItem extends StatelessWidget {
  final int step;
  final bool selected;
  const OnboardingStepItem(this.step, this.selected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4.0),
      child: AnimatedContainer(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          border: Border.all(color: selected ? gray900 : gray500),
          borderRadius: BorderRadius.circular(16.0),
        ),
        duration: const Duration(milliseconds: defualtAnimDuration),
        child: Center(
          child: Text(
            step.toString(),
            style:
                TextStyle(color: selected ? gray900 : gray500, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class PreviousButton extends StatelessWidget {
  final Function onClick;
  const PreviousButton(this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onClick(),
      child: Row(
        children: const [
          Icon(Icons.arrow_back),
          Text("Previous", style: TextStyle(fontSize: 20.0)),
        ],
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        ),
      ),
    );
  }
}

class NextStepButton extends StatelessWidget {
  final Function onClick;
  const NextStepButton(this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onClick(),
      child: Row(
        children: const [
          Text("Next Step", style: TextStyle(fontSize: 20.0)),
          Icon(Icons.arrow_forward),
        ],
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0)),
      ),
    );
  }
}
