part of 'onboarding_bloc.dart';

@immutable
class OnboardingState extends Equatable {
  final int step;
  final OnboardingStep currentStep;
  final List<String> selectedCuisines;
  final List<String> selectedDiets;
  final bool navigateToHomePage;

  const OnboardingState({
    required this.step,
    required this.currentStep,
    required this.selectedCuisines,
    required this.selectedDiets,
    required this.navigateToHomePage,
  });

  factory OnboardingState.initial() {
    return OnboardingState(
      step: startingStep,
      currentStep: steps[0],
      selectedCuisines: const [],
      selectedDiets: const [],
      navigateToHomePage: false,
    );
  }

  OnboardingState copyWith({
    int? step,
    OnboardingStep? currentStep,
    List<String>? selectedCuisines,
    List<String>? selectedDiets,
    bool? navigateToHomePage,
  }) {
    return OnboardingState(
      step: step ?? this.step,
      currentStep: currentStep ?? this.currentStep,
      selectedCuisines: selectedCuisines ?? this.selectedCuisines,
      selectedDiets: selectedDiets ?? this.selectedDiets,
      navigateToHomePage: navigateToHomePage ?? this.navigateToHomePage,
    );
  }

  @override
  List<Object?> get props =>
      [step, currentStep, selectedCuisines, selectedDiets, navigateToHomePage];
}
