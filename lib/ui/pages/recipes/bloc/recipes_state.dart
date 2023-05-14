part of 'recipes_bloc.dart';

class RecipesState extends Equatable {
  final List<Recipe> recipes;
  final List<Recipe> random;
  final UiState uiState;

  const RecipesState({
    required this.recipes,
    required this.random,
    required this.uiState,
  });

  factory RecipesState.initial() => const RecipesState(
        recipes: [],
        random: [],
        uiState: loading,
      );

  RecipesState copyWith({
    List<Recipe>? recipes,
    List<Recipe>? random,
    UiState? uiState,
  }) {
    return RecipesState(
      recipes: recipes ?? this.recipes,
      random: random ?? this.random,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object> get props => [recipes, uiState];
}
