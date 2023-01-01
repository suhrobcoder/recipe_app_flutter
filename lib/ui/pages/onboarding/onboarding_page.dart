import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/di/init_get_it.dart';
import 'package:recipe_app/ui/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:recipe_app/ui/pages/onboarding/onboarding_step.dart';
import 'package:recipe_app/ui/theme/color_theme.dart';
import 'package:recipe_app/ui/theme/constants.dart';

import '../../components/recipe_chip.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingBloc>(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0.0,
              title: Row(
                children: List.generate(
                  steps.length,
                  (index) =>
                      OnboardingStepItem(index + 1, index == state.step - 1),
                ),
              ),
              actions: [
                Container(
                  height: 48.0,
                  padding: const EdgeInsets.only(right: defaultPadding),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: TextButton(
                    onPressed: () {
                      context.read<OnboardingBloc>().add(Skip());
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
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.currentStep.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "To offer you the best recipes we need to know your some information",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: defaultPadding),
                  Expanded(
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: state.currentStep.items
                          .map(
                            (step) => RecipeChip(
                              step,
                              (state.step == 1
                                      ? state.selectedCuisines
                                      : state.selectedDiets)
                                  .contains(step),
                              () => context
                                  .read<OnboardingBloc>()
                                  .add(SelectItem(step)),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Row(
                    children: [
                      AnimatedSize(
                        duration:
                            const Duration(milliseconds: defualtAnimDuration),
                        child: state.step > 1
                            ? PreviousButton(
                                () {
                                  context
                                      .read<OnboardingBloc>()
                                      .add(PrevStep());
                                },
                              )
                            : const SizedBox.shrink(),
                      ),
                      const Spacer(),
                      NextStepButton(
                        () => context.read<OnboardingBloc>().add(NextStep()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
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
      padding: const EdgeInsets.only(right: 4.0),
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
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        ),
      ),
      child: Row(
        children: const [
          Icon(Icons.arrow_back),
          Text("Previous", style: TextStyle(fontSize: 20.0)),
        ],
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
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0)),
      ),
      child: Row(
        children: const [
          Text("Next Step", style: TextStyle(fontSize: 20.0)),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
