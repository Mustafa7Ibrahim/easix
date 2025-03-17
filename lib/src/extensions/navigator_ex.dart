import 'package:flutter/material.dart';

extension NavigatorEx on BuildContext {
  /// Creates a standard MaterialPageRoute with given screen widget
  Route<T> _createRoute<T>(Widget screen, {bool fullscreenDialog = false}) {
    return MaterialPageRoute<T>(
      builder: (_) => screen,
      fullscreenDialog: fullscreenDialog,
    );
  }

  /// Navigator instance getter for this context
  NavigatorState get navigator => Navigator.of(this);

  /// Push a new screen and return the result (if any)
  Future<T?> pushScreen<T extends Object?>(
    Widget screen, {
    bool fullscreenDialog = false,
  }) {
    return navigator
        .push<T>(_createRoute<T>(screen, fullscreenDialog: fullscreenDialog));
  }

  /// Replace current screen with a new one
  Future<T?> replaceScreen<T extends Object?, TO extends Object?>(
    Widget screen, {
    TO? result,
    bool fullscreenDialog = false,
  }) {
    return navigator.pushReplacement<T, TO>(
      _createRoute<T>(screen, fullscreenDialog: fullscreenDialog),
      result: result,
    );
  }

  /// Push screen and remove routes based on predicate
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget screen,
    bool Function(Route<dynamic>) predicate, {
    bool fullscreenDialog = false,
  }) {
    return navigator.pushAndRemoveUntil<T>(
      _createRoute<T>(screen, fullscreenDialog: fullscreenDialog),
      predicate,
    );
  }

  /// Push screen and clear all previous routes
  Future<T?> pushAndClearStack<T extends Object?>(
    Widget screen, {
    bool fullscreenDialog = false,
  }) {
    return pushAndRemoveUntil<T>(screen, (_) => false,
        fullscreenDialog: fullscreenDialog);
  }

  /// Push a modal screen (using root navigator)
  Future<T?> pushModal<T extends Object?>(
    Widget screen, {
    bool fullscreenDialog = false,
  }) {
    return Navigator.of(this, rootNavigator: true)
        .push<T>(_createRoute<T>(screen, fullscreenDialog: fullscreenDialog));
  }

  /// Pop current screen with optional result
  void pop<T extends Object?>([T? result]) => navigator.pop<T>(result);

  /// Pop until a condition is met
  void popUntil(bool Function(Route<dynamic>) predicate) =>
      navigator.popUntil(predicate);

  /// Pop current screen and push a new one
  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    Widget screen, {
    TO? result,
    bool fullscreenDialog = false,
  }) {
    return navigator.pushReplacement<T, TO>(
      _createRoute<T>(screen, fullscreenDialog: fullscreenDialog),
      result: result,
    );
  }

  /// Check if navigator can pop
  bool canPop() => navigator.canPop();

  /// Pop all routes until the first route
  void popToRoot() => navigator.popUntil((route) => route.isFirst);
}
