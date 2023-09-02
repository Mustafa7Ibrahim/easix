import 'package:equatable/equatable.dart';

/// Failure class to handle errors
class Failure extends Equatable implements Exception {
  /// Failure constructor
  const Failure({
    required this.message,
    this.statusCode = 0,
    this.stackTrace = StackTrace.empty,
  });

  /// Failure message
  final String message;

  /// status code
  final int statusCode;

  /// stack trace
  final StackTrace stackTrace;

  /// Failure toString method
  @override
  String toString() => message;

  @override
  List<Object?> get props => [message, statusCode, stackTrace];
}
