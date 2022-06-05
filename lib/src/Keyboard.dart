part of flutter_utils;

/// Keyboard Helper
/// ================
/// Keyboard helper provides you a handy helper method to hide opened keyboard.
///
/// Usage
/// ----------------
/// ```dart
/// GestureDetector(
///   onTap: () => Keyboard.hide(context),
///   child: const Container(
///     color: Colors.white,
///     //....
///   ),
/// ),
/// ```
class Keyboard {
  static void hide(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}

/// Keyboard Helper Method
/// ================
/// Alternatively you can use helper method.
///
/// ```dart
/// GestureDetector(
///   onTap: () => hideKeyboard(context),
///   child: const Container(
///     color: Colors.white,
///     //....
///   ),
/// ),
/// ```

hideKeyboard(BuildContext context) {
  return Keyboard.hide(context);
}
