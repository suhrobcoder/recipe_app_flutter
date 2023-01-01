part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class NextStep extends OnboardingEvent {}

class PrevStep extends OnboardingEvent {}

class Skip extends OnboardingEvent {}

class SelectItem extends OnboardingEvent {
  final String item;

  SelectItem(this.item);
}
