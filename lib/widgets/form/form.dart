import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staycation/data/blocs/form_bloc/form_bloc.dart';

Widget firstNameForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) {
      return previous.firstName != current.firstName;
    },
    builder: (context, state) {
      return TextFormField(
        initialValue: state.firstName.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          errorText: state.firstName.invalid ? "Please enter some Text" : null,
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context
              .read<CheckoutFormBloc>()
              .add(FirstNameChanged(firstName: value));
        },
        textInputAction: TextInputAction.next,
      );
    },
  );
}

Widget lastNameForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) => previous.lastName != current.lastName,
    builder: (context, state) {
      return TextFormField(
        initialValue: state.lastName.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          errorText: state.lastName.invalid ? "Please enter some Text" : null,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context
              .read<CheckoutFormBloc>()
              .add(LastNameChanged(lastName: value));
        },
        textInputAction: TextInputAction.next,
      );
    },
  );
}

Widget emailForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) => previous.email != current.email,
    builder: (context, state) {
      return TextFormField(
        initialValue: state.email.value,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          errorText:
              state.email.invalid ? "Please enter valid Email Address" : null,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context.read<CheckoutFormBloc>().add(EmailChanged(email: value));
        },
        textInputAction: TextInputAction.next,
      );
    },
  );
}

Widget phoneNumberForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) =>
        previous.phoneNumber != current.phoneNumber,
    builder: (context, state) {
      return TextFormField(
        initialValue: state.phoneNumber.value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          errorText: state.phoneNumber.invalid
              ? "Please enter valid Phone Number"
              : null,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context
              .read<CheckoutFormBloc>()
              .add(PhoneNumberChanged(phoneNumber: value));
        },
        textInputAction: TextInputAction.done,
      );
    },
  );
}

Widget senderNameForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) => previous.senderName != current.senderName,
    builder: (context, state) {
      return TextFormField(
        initialValue: state.senderName.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          errorText: state.senderName.invalid ? "Please enter some Text" : null,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context
              .read<CheckoutFormBloc>()
              .add(SenderNameChanged(senderName: value));
        },
        textInputAction: TextInputAction.next,
      );
    },
  );
}

Widget bankNameForm(context) {
  return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
    buildWhen: (previous, current) => previous.bankName != current.bankName,
    builder: (context, state) {
      return TextFormField(
        initialValue: state.bankName.value,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Please type here ...',
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: Color(0xFFAFAFAF),
              fontWeight: FontWeight.w400),
          errorText: state.bankName.invalid ? "Please enter some Text" : null,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
        onChanged: (value) {
          context
              .read<CheckoutFormBloc>()
              .add(BankNameChanged(bankName: value));
        },
        textInputAction: TextInputAction.next,
      );
    },
  );
}
