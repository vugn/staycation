import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure([String value = '']) : super.pure(value);
  const FirstName.dirty([String value = '']) : super.dirty(value);

  FirstNameValidationError? validator(String? value) {
    return value == null || value == ""
        ? FirstNameValidationError.invalid
        : null;
  }
}
