import 'package:formz/formz.dart';

enum SenderNameValidationError { invalid }

class SenderName extends FormzInput<String, SenderNameValidationError> {
  const SenderName.pure([String value = '']) : super.pure(value);
  const SenderName.dirty([String value = '']) : super.dirty(value);

  SenderNameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return SenderNameValidationError.invalid;
  }
}
