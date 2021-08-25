import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:staycation/widgets/form/first_name.dart';
import 'package:staycation/widgets/form/last_name.dart';
import 'package:staycation/widgets/form/models.dart';
import 'package:formz/formz.dart';

part 'form_event.dart';
part 'form_state.dart';

class CheckoutFormBloc extends Bloc<FormEvent, CheckoutFormState> {
  CheckoutFormBloc() : super(const CheckoutFormState());

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
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.phoneNumber]),
      );
    } else if (event is PhoneNumberChanged) {
      final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
      yield state.copyWith(
        phoneNumber: phoneNumber.valid
            ? phoneNumber
            : PhoneNumber.pure(event.phoneNumber),
        status: Formz.validate([state.email, phoneNumber]),
      );
    } else if (event is FirstNameChanged) {
      final firstName = FirstName.dirty(event.firstName);
      yield state.copyWith(
        firstName:
            firstName.valid ? firstName : FirstName.pure(event.firstName),
        status: Formz.validate([state.email, state.phoneNumber, firstName]),
      );
    } else if (event is LastNameChanged) {
      final lastName = LastName.dirty(event.lastName);
      yield state.copyWith(
        lastName: lastName.valid ? lastName : LastName.pure(event.lastName),
        status: Formz.validate(
            [state.email, state.phoneNumber, state.firstName, lastName]),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
      final firstName = FirstName.dirty(state.firstName.value);
      final lastName = LastName.dirty(state.lastName.value);
      yield state.copyWith(
        email: email,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        status: Formz.validate([email, phoneNumber, firstName, lastName]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
