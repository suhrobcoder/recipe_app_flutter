import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_app/data/repository/setting_repository.dart';
import 'package:recipe_app/ui/pages/onboarding/onboarding_step.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SettingsRepository settingsRepository;

  OnboardingBloc(this.settingsRepository) : super(OnboardingState.initial()) {
    on<NextStep>((event, emit) {
      if (state.step == steps.length) {
        saveResults();
      } else {
        emit(state.copyWith(
          step: state.step + 1,
          currentStep: steps[state.step],
        ));
      }
    });
    on<PrevStep>((event, emit) {
      if (state.step > 1) {
        emit(state.copyWith(
          step: state.step - 1,
          currentStep: steps[state.step - 2],
        ));
      }
    });
    on<Skip>((event, emit) {
      add(_NavigateToHomePage());
    });
    on<SelectItem>((event, emit) {
      if (state.step == 1) {
        if (state.selectedCuisines.contains(event.item)) {
          final result = state.selectedCuisines
              .where((element) => element != event.item)
              .toList();
          emit(state.copyWith(selectedCuisines: result));
        } else {
          emit(state.copyWith(
              selectedCuisines: [...state.selectedCuisines, event.item]));
        }
      } else if (state.step == 2) {
        if (state.selectedDiets.contains(event.item)) {
          final result = state.selectedDiets
              .where((element) => element != event.item)
              .toList();
          emit(state.copyWith(selectedDiets: result));
        } else {
          emit(state
              .copyWith(selectedDiets: [...state.selectedDiets, event.item]));
        }
      }
    });
    on<_NavigateToHomePage>((event, emit) async {
      await settingsRepository.setFirstRunFalse();
      emit(state.copyWith(navigateToHomePage: true));
    });
  }

  void saveResults() async {
    await settingsRepository.setDiets(state.selectedDiets);
    await settingsRepository.setCuisines(state.selectedCuisines);
    add(_NavigateToHomePage());
  }
}

class _NavigateToHomePage extends OnboardingEvent {}
