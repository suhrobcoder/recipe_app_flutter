// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchState extends Equatable {
  final TextEditingController searchController;
  final List<RecipeSearchItem> results;
  final String mealType;
  final String diet;
  final int cookTime;
  final UiState uiState;

  const SearchState({
    required this.searchController,
    required this.results,
    required this.mealType,
    required this.diet,
    required this.cookTime,
    required this.uiState,
  });

  factory SearchState.initial() {
    return SearchState(
      searchController: TextEditingController(),
      results: const [],
      mealType: "",
      diet: "",
      cookTime: 0,
      uiState: empty,
    );
  }

  SearchState copyWith({
    List<RecipeSearchItem>? results,
    String? mealType,
    String? diet,
    int? cookTime,
    UiState? uiState,
  }) {
    return SearchState(
      searchController: searchController,
      results: results ?? this.results,
      mealType: mealType ?? this.mealType,
      diet: diet ?? this.diet,
      cookTime: cookTime ?? this.cookTime,
      uiState: uiState ?? this.uiState,
    );
  }

  @override
  List<Object> get props => [results, mealType, diet, cookTime, uiState];
}
