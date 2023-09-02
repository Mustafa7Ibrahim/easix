/// Validate class contains all the validation methods
/// that are used in the application
/// This class is used to validate the user input
/// and return the error error if the input is invalid
/// otherwise it returns null
extension Validate on String? {
  /// Validate if the name is not empty
  /// returns an error error if empty
  /// returns null if not empty
  /// returns null if null
  /// [error] is the custom error to be returned
  String? validateName({String? error}) {
    if (this == null) return null;

    if (this!.isEmpty) {
      return error ?? 'Please Enter Your Name';
    }

    return null;
  }

  /// Validate if the email is not empty and valid
  /// returns an error error if empty
  /// returns null if not empty
  /// returns null if null
  /// [error] is the custom error to be returned
  String? validateEmail({String? error}) {
    if (this == null) return null;

    if (this!.isEmpty) {
      return error ?? "Please enter your email";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (!regex.hasMatch(this!)) return error ?? 'Enter Valid Email';

    return null;
  }

  /// Validate if the password is not empty and valid but doesn't check for
  /// strong password criteria like capital, small, number, special character
  /// returns an error error if empty
  /// returns null if not empty
  /// returns null if null
  /// [error] is the custom error to be returned
  /// [confirmPassword] is the password to be compared with
  /// to check if both are same
  String? validateWeakPassword({
    String? confirmPassword,
    String? error,
    String? errorNotMatch,
  }) {
    if (this == null) {
      return null;
    }
    if (confirmPassword != null && this != confirmPassword) {
      return errorNotMatch ?? "Passwords don't match";
    }
    if (this!.isEmpty) {
      return error ?? 'Please enter password';
    }
    return null;
  }

  /// Validate if the password is not empty and valid and checks for
  /// strong password criteria like capital, small, number, special character
  /// returns an error error if empty
  /// returns null if not empty
  /// returns null if null
  /// [confirmPassword] is the password to be compared with
  /// to check if both are same
  /// [error] is the custom error to be returned if password is empty
  /// [errorNotMatch] is the custom error to be returned
  /// if password and confirm password doesn't match
  String? validatePassword({
    String? confirmPassword,
    String? error,
    String? errorNotMatch,
  }) {
    if (this == null) {
      return null;
    }
    if (this!.isEmpty) {
      return error ?? "Password can't be empty";
    }
    if (confirmPassword != null && this != confirmPassword) {
      return errorNotMatch ?? "Passwords does't match";
    }
    final pattern = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    ).hasMatch(this!);
    if (pattern) {
      return null;
    } else {
      return "Your password must contain at least one capital, one small case letter, one number and 8 characters";
    }
  }
}
