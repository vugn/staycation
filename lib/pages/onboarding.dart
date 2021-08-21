import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  _StateOnboardingScreen createState() => _StateOnboardingScreen();
}

class _StateOnboardingScreen extends State<OnboardingScreen> {
  User? result = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    if (result != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 79,
        ),
        Image.asset('assets/images/family_onboarding.png',
            width: 486, height: 369),
        Container(
          width: 400,
          margin: EdgeInsets.only(top: 18, bottom: 48, left: 26, right: 26),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 15,
                    color: Color(0xFF616161).withOpacity(.05))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(
                height: 33,
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF253342)),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 262,
                margin: EdgeInsets.only(top: 18),
                child: Text(
                  'welcome to Staycation, We provide what you need to enjoy your holiday with family. Time to make another memorable moments.',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF253342)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF3252DF)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 34, vertical: 16))),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
