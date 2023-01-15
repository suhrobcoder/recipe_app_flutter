part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final Recipe recipe;
  final bool saved;
  final double panelSlide;

  const DetailsState({
    required this.recipe,
    required this.saved,
    required this.panelSlide,
  });

  factory DetailsState.initialState({required Recipe recipe}) {
    return DetailsState(recipe: recipe, saved: false, panelSlide: 0.0);
  }

  DetailsState copyWith({
    Recipe? recipe,
    bool? saved,
    double? panelSlide,
  }) {
    return DetailsState(
      recipe: recipe ?? this.recipe,
      saved: saved ?? this.saved,
      panelSlide: panelSlide ?? this.panelSlide,
    );
  }

  @override
  List<Object> get props => [recipe, saved, panelSlide];
}
