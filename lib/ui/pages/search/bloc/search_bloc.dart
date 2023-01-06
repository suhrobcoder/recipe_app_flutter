import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/recipe_search_item.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/util/ui_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final RecipeRepository recipeRepository;

  SearchBloc(this.recipeRepository) : super(SearchState.initial()) {
    on<ExecuteSearch>((event, emit) async {
      emit(state.copyWith(uiState: loading));
      (await recipeRepository.searchRecipes(query: state.searchController.text))
          .fold(
        (res) => emit(state.copyWith(results: res.results, uiState: success)),
        (failure) =>
            emit(state.copyWith(results: [], uiState: error(failure.message))),
      );
    });
    on<SelectMealType>((event, emit) {
      emit(state.copyWith(mealType: event.mealType));
    });
    on<SelectDiet>((event, emit) {
      emit(state.copyWith(diet: event.diet));
    });
    on<ChangeCookTime>((event, emit) {
      emit(state.copyWith(cookTime: event.cookTime));
    });
    on<ClearAll>((event, emit) {
      emit(state.copyWith(
        mealType: "",
        diet: "",
        cookTime: 0,
      ));
    });
    on<OpenPanel>((event, emit) {
      state.panelController.open();
    });
  }
}
