part of 'saved_bloc.dart';

class SavedState extends Equatable {
  final List<Recipe> recipes;
  const SavedState({
    required this.recipes,
  });

  factory SavedState.initial() => const SavedState(recipes: []);

  SavedState copyWith({
    List<Recipe>? recipes,
  }) {
    return SavedState(
      recipes: recipes ?? this.recipes,
    );
  }

  @override
  List<Object> get props => [];
}
