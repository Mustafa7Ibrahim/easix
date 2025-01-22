## 2.0.1

### Fixes:
- Fixe some issues with `adaptive_image.dart`.
- update example

## 2.0.1

### Fixes:
- Fixe all unexported files

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
  - `toColor()` for easy color conversion.
  - `NavigatorEx` to simplify navigation with context.
- Introduced new widgets:
  - `Gap` and `SliverGap` for spacing.
  - `AdaptiveImage()` for flexible image handling.

## 1.1.0

### Enhancements:
- Added new extensions for `theme`, `textTheme`, and `colorScheme`.
- Fixed the `initials` extension for improved functionality.
- Added the `initial` extension for extracting the first character.
- Introduced the `getTypeList` function for better type handling.

## 1.0.2

### Updates:
- Upgraded the initial version to `0.19.0`.

### New Functions:
- `isBefore`: Checks if one date is before another.
- `isAfter`: Checks if one date is after another.
- `differenceInMinutes`: Calculates the minute difference between two dates.
- `isBetween`: Verifies if a date falls between two others.
- `to12Time`: Converts a date to 12-hour time format.

## 1.0.1

### Features:
- Added the `initials` extension to extract initials from a string.

### Status:
- Marked as stable 🎉🎉🎉

### Fixes:
- General improvements and bug fixes.

## 1.0.0

### Features:
- Introduced the `initials` extension function to get initials from strings.

### Status:
- Marked as stable 🎉🎉🎉

## 0.0.6

### Fixes:
- Resolved an issue in `convertToSortedDateList` to ensure it returns a correctly sorted list of dates.

## 0.0.5

### New Features:
- Added the `convertToSortedDateList` function to convert a list with date properties into a sorted list.

### Enhancements:
- Improved the `toHumanDate()` function to support:
  - `Arabic` and `English` languages.
  - `short` and `full` date formats.
- Removed the `toHumanDateString()` extension function for cleaner API usage.

## 0.0.4

### Fixes:
- Addressed a failure issue.

## 0.0.3

### Fixes:
- Resolved an issue in the example.

## 0.0.2

### Fixes:
- Updated the README for clarity.

## 0.0.1

### Initial Release:
- Launched the first version of the package.
