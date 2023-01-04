part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final Recipe recipe;

  const DetailsState({
    required this.recipe,
  });

  factory DetailsState.initialState({required Recipe recipe}) {
    return DetailsState(recipe: recipe);
  }

  DetailsState copyWith({
    Recipe? recipe,
  }) {
    return DetailsState(
      recipe: recipe ?? this.recipe,
    );
  }

  @override
  List<Object> get props => [recipe];
}
