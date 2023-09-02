import 'package:easix/src/error/failure.dart';

/// Failure class to handle server errors
class ServerError extends Failure {
  /// ServerError constructor
  const ServerError({
    required super.message,
    super.stackTrace,
    super.statusCode,
  });

  @override
  String toString() {
    return 'ServerError: error: $message, statusCode: $statusCode ';
  }
}
