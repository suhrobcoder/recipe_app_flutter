part of 'search_bloc.dart';

abstract class SearchEvent {}

class ExecuteSearch extends SearchEvent {}

class SelectMealType extends SearchEvent {
  final String mealType;

  SelectMealType(this.mealType);
}

class SelectDiet extends SearchEvent {
  final String diet;

  SelectDiet(this.diet);
}

class ChangeCookTime extends SearchEvent {
  final int cookTime;

  ChangeCookTime(this.cookTime);
}

class ClearAll extends SearchEvent {}
