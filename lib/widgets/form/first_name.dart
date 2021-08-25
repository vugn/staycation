import 'package:formz/formz.dart';

enum FirstNameValidationError { invalid }

class FirstName extends FormzInput<String, FirstNameValidationError> {
  const FirstName.pure([String value = '']) : super.pure(value);
  const FirstName.dirty([String value = '']) : super.dirty(value);

  FirstNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return FirstNameValidationError.invalid;
  }
}
