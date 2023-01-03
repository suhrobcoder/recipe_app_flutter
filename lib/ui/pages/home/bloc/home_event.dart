part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class SelectTab extends HomeEvent {
  final int index;

  const SelectTab(this.index);
}
