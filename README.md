# Easix - A Flutter Package for Easy Form Validation and Useful Extensions

Easix is a Flutter package designed to simplify common tasks related to form field validation and provide helpful extensions for working with dates, times, widgets, and error handling. With Easix, you can streamline the development of your Flutter applications, making your code more efficient and maintainable.

| Demo                                                                                                                      |
|---------------------------------------------------------------------------------------------------------------------------|
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
- [x] Formatting DateTime objects to yyyy-MM-dd format
- [x] Formatting TimeOfDay objects to HH:mm:ss format
- [x] Adding padding to widgets, allowing customization of height, width, or both

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

### Form Field Validation

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

### Useful Extensions

Easix offers a variety of extensions to make your Flutter development easier and more productive. These extensions include:

Convert a string date to a human-readable date format

```dart
String date = DateTime.now().toString();
String humanReadableDate = date.toHumanStringDate(); // Output: just now
```

Convert a DateTime object to a human-readable date format

```dart
DateTime date = DateTime.now();
String humanReadableDate = date.toHumanDate(); // Output: just now
```

Format DateTime to format date as yyyy-MM-dd

```dart
DateTime date = DateTime.now();
String formattedDate = date.toHumanStringDate(); // Output: 2023-09-02
```

Format TimeOfDay to format time as HH:mm:ss

```dart
TimeOfDay time = TimeOfDay.now();
String formattedTime = time.toHumanStringTime(); // Output: "14:30:00"
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

### Error Handling

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
```
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

