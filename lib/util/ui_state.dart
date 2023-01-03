abstract class UiState {
  const UiState();
}

class UiStateLoading extends UiState {
  const UiStateLoading();
}

class UiStateSuccess extends UiState {
  const UiStateSuccess();
}

class UiStateError extends UiState {
  final String message;

  const UiStateError(this.message);
}

const loading = UiStateLoading();
const success = UiStateSuccess();
UiState error(String message) => UiStateError(message);
