import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/util/ui_state.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

@injectable
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeRepository recipeRepository;

  RecipesBloc(this.recipeRepository) : super(RecipesState.initial()) {
    on<LoadRecipesEvent>((event, emit) async {
      emit(state.copyWith(uiState: loading));
      (await recipeRepository.getRandomRecipes()).fold(
        (l) {
          print(l);
          emit(state.copyWith(recipes: l.recipes, uiState: success));
        },
        (r) => emit(state.copyWith(uiState: error(r.message))),
      );
    });
    add(LoadRecipesEvent());
  }
}
