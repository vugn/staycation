part of 'form_bloc.dart';

class CheckoutFormState extends Equatable {
  const CheckoutFormState({
    this.email = const Email.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.senderName = const SenderName.pure(),
    this.bankName = const BankName.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final PhoneNumber phoneNumber;
  final FirstName firstName;
  final LastName lastName;
  final SenderName senderName;
  final BankName bankName;
  final FormzStatus status;

  CheckoutFormState copyWith({
    Email? email,
    PhoneNumber? phoneNumber,
    FirstName? firstName,
    LastName? lastName,
    SenderName? senderName,
    BankName? bankName,
    FormzStatus? status,
  }) {
    return CheckoutFormState(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      senderName: senderName ?? this.senderName,
      bankName: bankName ?? this.bankName,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [email, phoneNumber, firstName, lastName, senderName, bankName, status];
}
