part of 'details_bloc.dart';

abstract class DetailsEvent {
  const DetailsEvent();
}

class PanelSlide extends DetailsEvent {
  final double slide;

  const PanelSlide(this.slide);
}

class ChangeSaved extends DetailsEvent {
  final bool saved;

  ChangeSaved(this.saved);
}
