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

class BankNameChanged extends FormEvent {
  const BankNameChanged({required this.bankName});

  final String bankName;

  @override
  List<Object> get props => [bankName];
}

class SenderNameChanged extends FormEvent {
  const SenderNameChanged({required this.senderName});

  final String senderName;

  @override
  List<Object> get props => [senderName];
}

class FormSubmitted extends FormEvent {
  const FormSubmitted({
    required this.idItem,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.image,
  });

  final String idItem;
  final String startDate;
  final String endDate;
  final String duration;
  final File image;

  @override
  List<Object> get props => [
        idItem,
        startDate,
        endDate,
        duration,
        image,
      ];
}
