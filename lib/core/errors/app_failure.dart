import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable implements Exception {
  const AppFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends AppFailure {
  const ServerFailure(super.message);
}

class TravelRequestFailure extends AppFailure {
  const TravelRequestFailure(super.message);
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message, this.errors);

  final Map<String, List<String>> errors;

  @override
  List<Object?> get props => [message, errors];
}

class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure(super.message);
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure(super.message);
}

class UnknownFailure extends AppFailure {
  const UnknownFailure(super.message);
}

class NoInternetFailure extends AppFailure {
  const NoInternetFailure() : super('failure.no_internet');
}

class UnexpectedFailure extends AppFailure {
  const UnexpectedFailure() : super('failure.unexpected');
}

// Additional failure types for enhanced error handling
class RateLimitFailure extends AppFailure {
  const RateLimitFailure(super.message);

  @override
  List<Object?> get props => [message];
}
