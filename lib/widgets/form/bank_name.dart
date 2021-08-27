import 'package:formz/formz.dart';

enum BankNameValidationError { invalid }

class BankName extends FormzInput<String, BankNameValidationError> {
  const BankName.pure([String value = '']) : super.pure(value);
  const BankName.dirty([String value = '']) : super.dirty(value);

  BankNameValidationError? validator(String? value) {
    return value == null || value == ""
        ? BankNameValidationError.invalid
        : null;
  }
}
