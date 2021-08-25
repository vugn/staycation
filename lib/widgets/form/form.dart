import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staycation/data/blocs/form_bloc/form_bloc.dart';

class FirstNameForm extends StatefulWidget {
  const FirstNameForm({Key? key}) : super(key: key);

  @override
  _FirstNameFormState createState() => _FirstNameFormState();
}

class _FirstNameFormState extends State<FirstNameForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final GlobalKey<FormFieldState> _firstNameFormKey =
      GlobalKey<FormFieldState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: _firstNameController,
          key: _firstNameFormKey,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Please type here ...',
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
            setState(() {
              _firstNameFormKey.currentState!.validate();
            });
          },
          validator: (String? value) {
            return state.firstName.valid ? null : "Please enter some Text";
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class LastNameForm extends StatefulWidget {
  const LastNameForm({Key? key}) : super(key: key);

  @override
  _LastNameFormState createState() => _LastNameFormState();
}

class _LastNameFormState extends State<LastNameForm> {
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormFieldState> _lastNameFormKey =
      GlobalKey<FormFieldState>();

  @override
  void dispose() {
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: _lastNameController,
          key: _lastNameFormKey,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Please type here ...',
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
                .add(LastNameChanged(lastName: value));
            setState(() {
              _lastNameFormKey.currentState!.validate();
            });
          },
          validator: (String? value) {
            return state.lastName.valid ? null : "Please enter some Text";
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormFieldState> _emailFormKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: _emailController,
          key: _emailFormKey,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Please type here ...',
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
            context.read<CheckoutFormBloc>().add(EmailChanged(email: value));
            setState(() {
              _emailFormKey.currentState!.validate();
            });
          },
          validator: (String? value) {
            return state.email.valid
                ? null
                : "Please enter valid Email Address";
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({Key? key}) : super(key: key);

  @override
  _PhoneNumberFormState createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormFieldState> _phoneNumberFormKey =
      GlobalKey<FormFieldState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
      builder: (context, state) {
        return TextFormField(
          controller: _phoneNumberController,
          key: _phoneNumberFormKey,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Please type here ...',
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
                .add(PhoneNumberChanged(phoneNumber: value));
            setState(() {
              _phoneNumberFormKey.currentState!.validate();
            });
          },
          validator: (String? value) {
            return state.phoneNumber.valid
                ? null
                : "Please enter valid Phone Number";
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
