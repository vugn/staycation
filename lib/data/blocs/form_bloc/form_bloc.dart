import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:staycation/widgets/form/models.dart';
import 'package:formz/formz.dart';

import '../../api_base_helper.dart';

part 'form_event.dart';
part 'form_state.dart';

class CheckoutFormBloc extends Bloc<FormEvent, CheckoutFormState> {
  CheckoutFormBloc() : super(CheckoutFormState());

  @override
  void onTransition(Transition<FormEvent, CheckoutFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<CheckoutFormState> mapEventToState(FormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email,
        status: Formz.validate([
          email,
          state.phoneNumber,
          state.firstName,
          state.lastName,
        ]),
      );
    } else if (event is PhoneNumberChanged) {
      final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
      yield state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([
          state.email,
          phoneNumber,
          state.firstName,
          state.lastName,
        ]),
      );
    } else if (event is FirstNameChanged) {
      final firstName = FirstName.dirty(event.firstName);
      yield state.copyWith(
        firstName: firstName,
        status: Formz.validate([
          state.email,
          state.phoneNumber,
          firstName,
          state.lastName,
        ]),
      );
    } else if (event is LastNameChanged) {
      final lastName = LastName.dirty(event.lastName);
      yield state.copyWith(
        lastName: lastName,
        status: Formz.validate([
          state.email,
          state.phoneNumber,
          state.firstName,
          lastName,
        ]),
      );
    } else if (event is SenderNameChanged) {
      final senderName = SenderName.dirty(event.senderName);
      yield state.copyWith(
        senderName: senderName,
        status: Formz.validate([
          state.email,
          state.phoneNumber,
          state.firstName,
          state.lastName,
          senderName,
        ]),
      );
    } else if (event is BankNameChanged) {
      final bankName = BankName.dirty(event.bankName);
      yield state.copyWith(
        bankName: bankName,
        status: Formz.validate([
          state.email,
          state.phoneNumber,
          state.firstName,
          state.lastName,
          state.senderName,
          bankName,
        ]),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
      final firstName = FirstName.dirty(state.firstName.value);
      final lastName = LastName.dirty(state.lastName.value);
      final senderName = SenderName.dirty(state.senderName.value);
      final bankName = BankName.dirty(state.bankName.value);
      yield state.copyWith(
        email: email,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        senderName: senderName,
        bankName: bankName,
        status: Formz.validate(
            [email, phoneNumber, firstName, lastName, senderName, bankName]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await ApiBaseHelper().postMultipart(
            'api/v1/member/booking-page',
            {
              'idItem': event.idItem,
              'duration': event.duration,
              'bookingStartDate': event.startDate,
              'bookingEndDate': event.endDate,
              'firstName': state.firstName.value,
              'lastName': state.lastName.value,
              'email': state.email.value,
              'accountHolder': state.senderName.value,
              'phoneNumber': state.phoneNumber.value,
              'bankFrom': state.bankName.value,
            },
            event.image,
            "imageUrl");
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
