import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/data/repository/saved_recipes_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final RecipeRepository recipeRepository;
  final SavedRecipesRepository savedRepository;
  final Recipe recipe;

  DetailsBloc(
    this.recipeRepository,
    this.savedRepository,
    @factoryParam this.recipe,
  ) : super(DetailsState.initialState(recipe: recipe)) {
    on<_RecipeLoadedEvent>((event, emit) {
      emit(state.copyWith(recipe: recipe));
    });
    loadRecipe();
  }

  void loadRecipe() async {
    final recipeFromDb = await savedRepository.getRecipeById(recipe.id);
    if (recipeFromDb != null) {
      add(_RecipeLoadedEvent(recipeFromDb));
      return;
    }
    (await recipeRepository.getRecipeById(id: recipe.id)).fold(
      (recipeFromNetwork) => add(_RecipeLoadedEvent(recipeFromNetwork)),
      (failure) => print("Error ${failure.message}"),
    );
  }
}

class _RecipeLoadedEvent extends DetailsEvent {
  final Recipe recipe;

  const _RecipeLoadedEvent(this.recipe);
}
