part of 'recipes_bloc.dart';

class RecipesState extends Equatable {
  final List<Recipe> recipes;
  final UiState uiState;

  const RecipesState({
    required this.recipes,
    required this.uiState,
  });

  factory RecipesState.initial() => const RecipesState(
        recipes: [],
        uiState: loading,
      );

  RecipesState copyWith({
    List<Recipe>? recipes,
    UiState? uiState,
  }) {
    return RecipesState(
      recipes: recipes ?? this.recipes,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object> get props => [recipes, uiState];
}
