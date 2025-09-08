## 3.0.0

### Breaking Changes:
- Updates minimum supported SDK version to Flutter 3.27/Dart 3.6
- Add support for Flutter 3.35.2, Dart 3.9.0

### New Features:
- **Enhanced DateTime & TimeOfDay Extensions**: Comprehensive date and time formatting extensions with 20+ new methods
  - Added multiple date formats: US format (`MM/dd/yyyy`), European format (`dd.MM.yyyy`), ISO-like format, compact formats
  - Added relative time formatting: "2 days ago", "in 3 hours", simplified "2h", "30m"
  - Added weekday and month name extractors (full and short)
  - Added ordinal day formatting: "1st", "2nd", "3rd", "8th"
  - Added smart chat timestamp formatting for messaging apps
  - Added TimeOfDay utilities: AM/PM checks, time arithmetic (add/subtract minutes), time range checking
  - Added DateTime conversion methods for TimeOfDay
  - Added time remaining calculator and total minutes converter
  - Combined `format_as_ymd.dart` and `format_as_his.dart` into a single comprehensive extension file
  - Added detailed documentation with usage examples for all methods

### Deprecations:
- **DEPRECATED**: All EmptyPadding extension getters (`ph`, `pw`, `p`) are now deprecated. Use `Gap` and `SliverGap` widgets instead for better performance and consistency

## 2.0.4

### Fixes:
- Fixed and optimized `navigator_ex.dart`
- Fixed issues with `adaptive_image.dart`
- Updated example

## 2.0.1

### Fixes:
- Fixed all unexported files

## 2.0.0

### Breaking Changes:
- Removed the following error-handling functions:
  - `ServerError`
  - `LocalError`
  - `Failure`
  - `Validate` extension

### New Features:
- Introduced several `ThemeExtension` additions:
  - `elevatedButtonTheme`
  - `outlinedButtonTheme`
  - `textButtonTheme`
  - `textSelectionTheme`
  - `appBarTheme`
- Added new extensions:
  - `toColor()` for easy color conversion
  - `NavigatorEx` to simplify navigation with context
- Introduced new widgets:
  - `Gap` and `SliverGap` for spacing
  - `AdaptiveImage()` for flexible image handling

## 1.1.0

### Enhancements:
- Added new extensions for `theme`, `textTheme`, and `colorScheme`
- Fixed the `initials` extension for improved functionality
- Added the `initial` extension for extracting the first character
- Introduced the `getTypeList` function for better type handling

## 1.0.2

### Updates:
- Upgraded the initial version to `0.19.0`

### New Functions:
- `isBefore`: Checks if one date is before another
- `isAfter`: Checks if one date is after another
- `differenceInMinutes`: Calculates the minute difference between two dates
- `isBetween`: Verifies if a date falls between two others
- `to12Time`: Converts a date to 12-hour time format

## 1.0.1

### Features:
- Added the `initials` extension to extract initials from a string

### Status:
- Marked as stable 🎉🎉🎉

### Fixes:
- General improvements and bug fixes

## 1.0.0

### Features:
- Introduced the `initials` extension function to get initials from strings

### Status:
- Marked as stable 🎉🎉🎉

## 0.0.6

### Fixes:
- Resolved an issue in `convertToSortedDateList` to ensure it returns a correctly sorted list of dates

## 0.0.5

### New Features:
- Added the `convertToSortedDateList` function to convert a list with date properties into a sorted list

### Enhancements:
- Improved the `toHumanDate()` function to support:
  - `Arabic` and `English` languages
  - `short` and `full` date formats
- Removed the `toHumanDateString()` extension function for cleaner API usage

## 0.0.4

### Fixes:
- Addressed a failure issue

## 0.0.3

### Fixes:
- Resolved an issue in the example

## 0.0.2

### Fixes:
- Updated the README for clarity

## 0.0.1

### Initial Release:
- Launched the first version of the package
