import 'package:flutter/material.dart';

extension NavigatorEx on BuildContext {
  /// Push a new screen as a route onto the stack.
  void pushScreen(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  /// Replace the current screen with a new screen.
  void pushReplacementScreen(Widget screen, {Object? result}) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => screen),
      result: result,
    );
  }

  /// Push a new screen and remove all previous screens until the predicate is satisfied.
  void pushScreenAndRemoveUntil(
    Widget screen,
    bool Function(Route<dynamic>) predicate,
  ) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      predicate,
    );
  }

  /// Push a fullscreen dialog screen.
  Future<T?> pushFullscreenDialog<T extends Object?>(Widget screen) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: true,
      ),
    );
  }

  /// Pop the current route off the stack.
  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Pop routes until the specified condition is met.
  void popUntilCondition(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  /// Pop the current screen and push a new screen onto the stack.
  void popAndPushScreen(Widget screen) {
    Navigator.of(this).popAndPushNamed(
      MaterialPageRoute(builder: (context) => screen).settings.name ?? '',
      arguments: screen,
    );
  }

  /// Check if there are any routes in the navigation stack that can be popped.
  bool canPop() {
    return Navigator.of(this).canPop();
  }

  /// Push a new screen and clear the navigation stack.
  void pushScreenAndClearStack(Widget screen) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  /// Push a screen modally (without adding to the navigation stack).
  Future<T?> pushModal<T extends Object?>(Widget screen) {
    return Navigator.of(this, rootNavigator: true).push<T>(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Push a new screen and return the result after the screen is popped.
  Future<T?> pushScreenForResult<T extends Object?>(Widget screen) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
