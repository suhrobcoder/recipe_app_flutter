abstract class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("Internet connection is required");
}

class AuthFailure extends Failure {
  AuthFailure() : super("API key is expired");
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super("Time out");
}

class UnknownFailure extends Failure {
  UnknownFailure() : super("Something went wrong");
}
