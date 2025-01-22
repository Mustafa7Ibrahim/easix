# Easix

Easix is a Flutter package designed to simplify common tasks related to form field validation and provide helpful extensions for working with dates, times, widgets, and error handling. With Easix, you can streamline the development of your Flutter applications, making your code more efficient and maintainable.

## Features

### Useful Extensions

Easix offers a variety of extensions to make your Flutter development easier and more productive. These extensions include:

- [x] Converting a string date to a human-readable date format
- [x] Converting a Datetime to a human-readable time
- [x] Formatting DateTime objects to yyyy-MM-dd format
- [x] Formatting TimeOfDay objects to HH:mm:ss format
- [x] Adding padding to widgets, allowing customization of height, width, or both
- [x] Adding an extension to the String class to get the first letters of a string
- [x] Checking if a `TimeOfDay` is before or after another
- [x] Calculating the difference in minutes between two `TimeOfDay` objects
- [x] Checking if a `TimeOfDay` is between two others
- [x] Converting time to 12-hour format with optional meridian display
- [x] Get the initials of a string.
- [x] Add extensions for `theme`, `textTheme` and `colorScheme` for easy access to theme properties.
- [x] Add `initial` extension to get the first letter of a string.

### Useful Functions

- [x] Convert any list with a date property to a sorted list of dates, where it will be sorted by the date property in the list items.
- [x] GetTypeList function to get a list of types from a list of objects.

## Installation

To get started with Easix, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  easix: ^2.0.0
```

## Usage

### Gap and SliverGap Widgets

Easix provides `Gap` and `SliverGap` widgets for adding spacing between widgets.

```dart
Column(
  children: [
    Text('Item 1'),
    Gap(16.0),
    Text('Item 2'),
  ],
);

CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildListDelegate([
        Text('Item 1'),
        SliverGap(16.0),
        Text('Item 2'),
      ]),
    ),
  ],
);
```

### Adaptive Image Widget

Easix provides an `AdaptiveImage` widget that supports displaying network images, local SVG files, remote SVG files, local image files, and asset images.

```dart
AdaptiveImage(
  'https://example.com/image.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
  borderRadius: 8.0,
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.error),
  color: Colors.blue,
  alignment: Alignment.center,
  repeat: ImageRepeat.noRepeat,
  borderColor: Colors.black,
  borderWidth: 1.0,
  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
  overlayColor: Colors.black.withOpacity(0.5),
  gradient: LinearGradient(colors: [Colors.black, Colors.transparent]),
  animationDuration: Duration(milliseconds: 300),
  animationCurve: Curves.easeInOut,
  onTap: () => print('Image tapped'),
  onDoubleTap: () => print('Image double tapped'),
  onLongPress: () => print('Image long pressed'),
);
```

### Navigation Extensions

Easix provides a set of navigation extensions to simplify navigation in your Flutter applications. These extensions include:

Push a new screen as a route onto the stack.

```dart
context.pushScreen(MyScreen());
```

Replace the current screen with a new screen.

```dart
context.pushReplacementScreen(MyScreen());
```

Push a new screen and remove all previous screens until the predicate is satisfied.

```dart
context.pushScreenAndRemoveUntil(MyScreen(), (route) => false);
```

Push a fullscreen dialog screen.

```dart
context.pushFullscreenDialog(MyScreen());
```

Pop the current route off the stack.

```dart
context.pop();
```

Pop routes until the specified condition is met.

```dart
context.popUntilCondition((route) => route.isFirst);
```

Pop the current screen and push a new screen onto the stack.

```dart
context.popAndPushScreen(MyScreen());
```

Check if there are any routes in the navigation stack that can be popped.

```dart
bool canPop = context.canPop();
```

Push a new screen and clear the navigation stack.

```dart
context.pushScreenAndClearStack(MyScreen());
```

Push a screen modally (without adding to the navigation stack).

```dart
context.pushModal(MyScreen());
```

Push a new screen and return the result after the screen is popped.

```dart
final result = await context.pushScreenForResult(MyScreen());
```

### Useful Extensions Examples

Easix offers a variety of extensions to make your Flutter development easier and more productive. These extensions include:

Convert a string date to a human-readable date format

| Demo                                                                                                   |
| ------------------------------------------------------------------------------------------------------ |
| <img src="https://github.com/Mustafa7Ibrahim/easix/blob/main/assets/preview2.png?raw=true" alt="Demo"> |

```dart
"Now (English): ${now.toHumanDate()}\n"
"Before 1 Hour (English): ${now.subtract(Duration(hours: 1)).toHumanDate()}\n"
"Before 1 Day (English): ${now.subtract(Duration(days: 1)).toHumanDate()}\n"
"Before 2 Days (English): ${now.subtract(Duration(days: 2)).toHumanDate()}\n"
"Before 10 Days (English, Short): ${now.subtract(Duration(days: 10)).toHumanDate()}\n"
"Before 10 Days (English, Full): ${now.subtract(Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
"Before 1 Month (English): ${now.subtract(Duration(days: 30)).toHumanDate()}\n"
"Before 1 Year (English, full): ${now.subtract(Duration(days: 365)).toHumanDate(displayType: DateMode.full)}\n"
"-----------------------------------\n"
"Before 1 Hour (Arabic): ${now.subtract(Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
"Before 1 Day (Arabic): ${now.subtract(Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
"Before 2 Days (Arabic): ${now.subtract(Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
"Before 10 Days (Arabic, Short): ${now.subtract(Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
"Before 10 Days (Arabic, Full): ${now.subtract(Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
"Before 1 Month (Arabic): ${now.subtract(Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
"Before 1 Year (Arabic, full): ${now.subtract(Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n"
"-----------------------------------\n"
"After 1 Hour (English): ${now.add(Duration(hours: 1)).toHumanDate()}\n"
"After 1 Day (English): ${now.add(Duration(days: 1)).toHumanDate()}\n"
"After 2 Days (English): ${now.add(Duration(days: 2)).toHumanDate()}\n"
"After 10 Days (English, Short): ${now.add(Duration(days: 10)).toHumanDate()}\n"
"After 10 Days (English, Full): ${now.add(Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
"After 1 Month (English): ${now.add(Duration(days: 30)).toHumanDate()}\n"
"After 1 Year (English, full): ${now.add(Duration(days: 365)).toHumanDate()}\n"
"-----------------------------------\n"
"After 1 Hour (Arabic): ${now.add(Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
"After 1 Day (Arabic): ${now.add(Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
"After 2 Days (Arabic): ${now.add(Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
"After 10 Days (Arabic, Short): ${now.add(Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
"After 10 Days (Arabic, Full): ${now.add(Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
"After 1 Month (Arabic): ${now.add(Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
"After 1 Year (Arabic, full): ${now.add(Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n"
```

Checking if a TimeOfDay is before or after another

```dart
bool isBefore = currentTime.isBefore(otherTime);
bool isAfter = currentTime.isAfter(otherTime);
```

Calculating the difference in minutes between two TimeOfDay objects

```dart
int minutesDifference = currentTime.differenceInMinutes(otherTime);
```

Checking if a TimeOfDay is between two others

```dart
bool isBetween = currentTime.isBetween(startTime, endTime);
```

Converting time to 12-hour format with optional meridian display

```dart
String formattedTime = '12:55:00'.to12Time(showMeridian: true);
```

Get the first letters of a string

```dart
// you can use it like this
final _firstLetters = 'Mustafa Ibrahim'.initials;
// it will return 'MI'
```

Get the first letter of a string

```dart
// you can use it like this
final _firstLetter = 'Mustafa Ibrahim'.initial;
// it will return 'M'
```

Add extensions for theme, textTheme, and colorScheme for easy access to theme properties

```dart
// you can use it like this
final _theme = context.theme;
final _textTheme = context.textTheme;
final _colorScheme = context.colorScheme;
```

Add padding to widgets, allowing customization of height, width, or both

```dart
// normaly when you want to add padding to a widget you do it like this
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text('Hello World'),
)
// or you can use SizedBox() like this
SizedBox(
  height: 8.0,
)
---------
SizedBox(
  width: 8.0,
)
// but with easix you can do it like this
8.ph // for virtical padding with 8.0 height
---------
8.pw // for horizontal padding with 8.0 width
---------
8.p // for both virtical and horizontal padding with 8.0 height and width
```

### Useful Functions Example

Convert any list with a date property to a sorted list of dates, where it will be sorted by the date property in the list items.

```dart
List<ExampleModel> _exampleList = [
  ExampleModel(
    id: 1,
    name: 'Example 1',
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  ExampleModel(
    id: 2,
    name: 'Example 2',
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  ExampleModel(
    id: 3,
    name: 'Example 3',
    date: DateTime.now().subtract(Duration(days: 3)),
  ),
  ExampleModel(
    id: 4,
    name: 'Example 4',
    date: DateTime.now().subtract(Duration(days: 4)),
  ),
  ExampleModel(
    id: 5,
    name: 'Example 5',
    date: DateTime.now().subtract(Duration(days: 5)),
  ),
  ExampleModel(
    id: 6,
    name: 'Example 6',
    date: DateTime.now().subtract(Duration(days: 6)),
  ),
];

// you can use it like this
final _sortedDateList = convertToSortedDateList(
  existingList: [],
  newList: _exampleList,
  dateProperty: (item) => item.date,
);

// it will return a list of dates sorted by the date property in the list items.
```

`SortedDateList` is a list of `SortedDate` where `SortedDate` is a class that has two properties `date` and `list` where `date` is the date property in the list items and `list` is a list of items that have the same date property.

`GetTypeList` function to get a list of types from a list of objects.

```dart
// you can use it like this
final examples = getTypeList<ExampleModel>(
  _exampleList,
  ExampleModel.fromJson,
);
```

## License

Easix is licensed under the MIT License.

```text
MIT License

Copyright (c) 2023 Mustafa Ibrahim.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Author

- [Author](https://github.com/Mustafa7Ibrahim)

## Contributors

All contributions are welcome. If you are interested in contributing to this project, please open a pull request.