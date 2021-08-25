import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  static final _phoneNumberRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,15}$)');

  PhoneNumberValidationError? validator(String? value) {
    return _phoneNumberRegex.hasMatch(value ?? '')
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
