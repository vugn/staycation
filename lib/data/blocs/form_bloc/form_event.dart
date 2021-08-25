part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends FormEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends FormEvent {
  const PhoneNumberChanged({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class FirstNameChanged extends FormEvent {
  const FirstNameChanged({required this.firstName});

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends FormEvent {
  const LastNameChanged({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class FormSubmitted extends FormEvent {}
