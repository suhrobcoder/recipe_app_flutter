part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int selectedTab;

  const HomeState({required this.selectedTab});

  factory HomeState.initial() {
    return HomeState(
      selectedTab: 0,
    );
  }

  HomeState copyWith({
    int? selectedTab,
  }) {
    return HomeState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object> get props => [];
}
