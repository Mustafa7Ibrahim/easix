import 'package:easix/src/error/failure.dart';

/// Failure class to handle local errors
class LocalError extends Failure {
  /// LocalError constructor
  const LocalError({required super.message});

  @override
  String toString() {
    return 'local error: error: $message';
  }
}
