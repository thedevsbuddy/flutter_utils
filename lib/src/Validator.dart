part of flutter_utils;

class Validator {
  Map<String, String> error = {};
  final String field;
  final String value;

  /// Validator is a Helper Class to help you implement validations
  /// on the [TextInputField] widget easily.
  ///
  /// **Note**
  ///
  /// [Validator] runs end to start which means it will effect last rule first.
  ///
  /// Example
  /// ```dart
  /// TextFormField(
  ///   controller: null,
  ///   keyboardType: TextInputType.text,
  ///   validator: (value) => Validator("Email", value!).email.required.validate(),
  /// ),
  /// ```
  /// In above example it will validate [required] first then if it satisfy with [required] rule
  /// it will move to [email] rule.
  Validator(this.field, this.value);

  /// Required rule
  ///==============
  /// It makes the field required which means
  /// users must enter something in the field to
  /// validate and continue.
  Validator get required {
    if (GetUtils.isLengthLessOrEqual(value, 0)) {
      error.assign(field, "${field.ucFirst()} is required");
    }
    return this;
  }

  /// Email rule
  ///==============
  /// It checked the value if it is a type of email or not.

  Validator get email {
    if (!GetUtils.isEmail(value)) {
      error.assign(field, "${field.ucFirst()} needs to be an email!");
    }
    return this;
  }

  /// MatchWith rule
  ///==============
  /// It compares the user input value
  /// with provided comparable value
  ///
  /// * [comparableField] can be another filed name.
  /// Eg: You can compare password and confirm password field using this validation method.
  /// * [val] must be the [String] and value you are comparing field value with.
  Validator matchWith(String val, String comparableField) {
    if (value != val) {
      error.assign(field, "${comparableField.ucFirst()} and ${field.ucFirst()} doesn't match!");
    }
    return this;
  }

  /// Number rule
  ///==============
  /// It checked the value if it is a type of [num] or not.
  Validator get number {
    if (!GetUtils.isNum(value)) {
      error.assign(field, "${field.ucFirst()} needs to be a number!");
    }
    return this;
  }

  /// Min rule
  ///==============
  /// It will check the value length with provided length
  /// * [length] is the min character size you need.
  Validator min(int length) {
    if (value.length < length) {
      error.assign(field, "${field.ucFirst()} must be greater than or $length character long!");
    }
    return this;
  }

  /// Max rule
  ///==============
  /// It will check the value length with provided length
  /// * [length] is the max character size you need.
  Validator max(int length) {
    if (GetUtils.isLengthGreaterThan(value, length)) {
      error.assign(field, "${field.ucFirst()} must be less than or equal to $length character long!");
    }
    return this;
  }

  /// Between rule
  ///==============
  /// It will check the value length with provided length
  /// and compare if it is between [minLength] or [maxLength] or not.
  /// * [minLength] is the min character size you need.
  /// * [maxLength] is the max character size you need.
  Validator between(int minLength, int maxLength) {
    if (!GetUtils.isLengthBetween(value, minLength, maxLength)) {
      error.assign(field, "${field.ucFirst()} must be between $minLength and $maxLength character!");
    }
    return this;
  }

  /// SpecialCharacter rule
  ///==============
  /// It will check if the value contains any special character
  /// * [allowedCharacters] is the special characters you want not to compare with.
  Validator specialCharacter({String? allowedCharacters}) {
    /// TODO: check the [allowedCharacters] and allow users to enter them
    if (value.contains(RegExp(r'[\s\-$&+,:;=?@#|<>\.^*()%!\\]'))) {
      error.assign(field, "${field.ucFirst()} not allow any special character except underscores (_)");
    }
    return this;
  }

  /// Validate method
  ///==============
  /// It will return the [error] if any.

  String? validate() {
    return error[field];
  }
}
