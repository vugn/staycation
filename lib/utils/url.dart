import 'package:flutter/material.dart';
import 'package:staycation/pages/home.dart';
import 'package:staycation/pages/login.dart';
import 'package:staycation/pages/onboarding.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => OnboardingScreen(),
    '/sign-in': (context) => LoginPage(),
    '/home': (context) => HomePage(),
  };
}
