# Easix - A Flutter Package for Easy Form Validation and Useful Extensions

Easix is a Flutter package designed to simplify common tasks related to form field validation and provide helpful extensions for working with dates, times, widgets, and error handling. With Easix, you can streamline the development of your Flutter applications, making your code more efficient and maintainable.

| Demo                                                                                                                                      |
| ----------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="https://github.com/Mustafa7Ibrahim/easix/blob/01c01c001935225ea1d2f0ec8b8c05767c5511e7/assets/preview.png?raw=true" alt="Demo"> |

## Features

### Form Field Validation

Easix includes a set of validation functions to ensure the integrity of your form fields. You can use these functions to validate:

- [x] Email
- [x] Passwords
- [x] Confirm passwords
- [x] Normal passwords

### Useful Extensions

Easix offers a variety of extensions to make your Flutter development easier and more productive. These extensions include:

- [x] Converting a string date to a human-readable date format
- [x] Converting a Datetime to a human-readable time
- [x] Formatting DateTime objects to yyyy-MM-dd format
- [x] Formatting TimeOfDay objects to HH:mm:ss format
- [x] Adding padding to widgets, allowing customization of height, width, or both

### useful functions

- [x] convert any list with a date property to a sorted list of dates, where it will be sorted by the date property in the list items.

### Error Handling

Easix provides error classes that can help you handle errors in your Flutter applications effectively. These error classes include:

- [x] ServerError: A class to handle server-related errors, making it easier to communicate with APIs and services.
- [x] LocalError: A class to handle local errors within your Flutter app, enhancing error reporting and debugging.

## Installation

To get started with Easix, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  easix: ^x.y.z
```

Replace ^x.y.z with the latest version of Easix available on pub.dev.

## Usage

### Form Field Validation Examples

Easix provides a set of validation functions to ensure the integrity of your form field for `Name`, `Email`, `password` and `Confirm password` field. You can use these functions to validate:

Validate name example

```dart
 TextFormField(
   controller: _nameController,

   /// you can use validator like this
   /// or even add a custom validator error message
   /// validator: (value) => value.validateName(error: 'custom error message'),
   validator: (value) => value.validateName(),
   decoration: const InputDecoration(
     labelText: 'Name',
   ),
 ),
```

Validate email example

```dart
 TextFormField(
   controller: _emailController,

   /// you can use validator like this
   /// or even add a custom validator error message
   /// validator: (value) => value.validateEmail(error: 'custom error message'),
   validator: (value) => value.validateEmail(),
   decoration: const InputDecoration(
     labelText: 'Email',
   ),
 ),
```

Validate password example

```dart
 TextFormField(
   controller: _passwordController,

   /// you can use validator like this
   /// or even add a custom validator error message
   /// validator: (value) => value.validatePassword(error: 'custom error message'),
   validator: (value) => value.validatePassword(),
   decoration: const InputDecoration(
     labelText: 'Password',
   ),
 ),
```

Validate confirm password example

```dart
 TextFormField(
   controller: _confirmPasswordController,

   /// you can use validator like this
   /// or even add a custom validator error message
   /// you can also add error message for not match password
   /// validator: (value) => value.validatePassword(confirmPassword: _passwordController.text, error: 'custom error message' errorNotMatch: 'custom error message'),
   /// with confirm password validator
   validator: (value) => value.validatePassword(
     confirmPassword: _passwordController.text,
     error: 'Password and confirm password not match',
     errorNotMatch: 'Password and confirm password not match',
   ),
   decoration: const InputDecoration(
     labelText: 'Confirm Password',
   ),
 ),
```

Validate week password example

```dart
 TextFormField(
   controller: _weekPasswordController,

   /// you can use validator like this
   /// or even add a custom validator error message
   /// validator: (value) => value.validateWeakPassword(error: 'custom error message'),
   /// with week password validator where it's not necessary to have a number or special character
   validator: (value) => value.validateWeakPassword(),
   decoration: const InputDecoration(
     labelText: 'Week Password',
   ),
 ),
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

### Useful functions example

convert any list with a date property to a sorted list of dates, where it will be sorted by the date property in the list items.

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
`SortedDateList` is a list of `SortedDate` where `SortedDate` is a class that has two properties `date` and `list` where `date` is the date property in the list items and `list` is a list of items that have the same date property.
```

### Error Handling Implementation

Easix provides error classes that can help you handle errors in your Flutter applications effectively. These error classes include:

ServerError: A class to handle server-related errors, making it easier to communicate with APIs and services.

```dart
try {
  // your code
} on ServerError catch (e) {
  // handle error
}
```

LocalError: A class to handle local errors within your Flutter app, enhancing error reporting and debugging.

```dart
try {
  // your code
} on LocalError catch (e) {
  // handle error
}
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

- [Mustafa Ibrahim](https://github.com/Mustafa7Ibrahim)

## Contributors

All contributions are welcome. If you are interested in contributing to this project, please open a pull request.
