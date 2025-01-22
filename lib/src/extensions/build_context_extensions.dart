import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide easy access to various theme-related properties.
///
/// Provides convenient getters for accessing:
/// - [ThemeData] via `theme`
/// - [TextTheme] via `textTheme`
/// - [ColorScheme] via `colorScheme`
/// - [ElevatedButtonThemeData] via `elevatedButtonTheme`
/// - [OutlinedButtonThemeData] via `outlinedButtonTheme`
/// - [TextSelectionThemeData] via `textSelectionTheme`
/// - [TextButtonThemeData] via `textButtonTheme`
/// - [AppBarTheme] via `appBarTheme`

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButtonTheme =>
      Theme.of(this).outlinedButtonTheme;
  TextSelectionThemeData get textSelectionTheme =>
      Theme.of(this).textSelectionTheme;
  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
}
