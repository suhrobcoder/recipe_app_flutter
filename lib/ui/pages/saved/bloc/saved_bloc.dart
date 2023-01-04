import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/saved_recipes_repository.dart';

part 'saved_event.dart';
part 'saved_state.dart';

@injectable
class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRecipesRepository savedRepository;

  SavedBloc(this.savedRepository) : super(SavedState.initial()) {
    on<_RecipesLoadedEvent>((event, emit) {
      emit(state.copyWith(recipes: event.recipes));
    });
    savedRepository.getAllRecipes().listen((event) {
      add(_RecipesLoadedEvent(event));
    });
  }
}

class _RecipesLoadedEvent extends SavedEvent {
  final List<Recipe> recipes;

  _RecipesLoadedEvent(this.recipes);
}
