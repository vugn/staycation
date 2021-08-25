import 'package:formz/formz.dart';

enum BankFromValidationError { invalid }

class BankFrom extends FormzInput<String, BankFromValidationError> {
  const BankFrom.pure([String value = '']) : super.pure(value);
  const BankFrom.dirty([String value = '']) : super.dirty(value);

  BankFromValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return BankFromValidationError.invalid;
  }
}
