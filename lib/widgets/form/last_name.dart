import 'package:formz/formz.dart';

enum LastNameValidationError { invalid }

class LastName extends FormzInput<String, LastNameValidationError> {
  const LastName.pure([String value = '']) : super.pure(value);
  const LastName.dirty([String value = '']) : super.dirty(value);

  LastNameValidationError? validator(String? value) {
    return value == null || value == ""
        ? LastNameValidationError.invalid
        : null;
  }
}
