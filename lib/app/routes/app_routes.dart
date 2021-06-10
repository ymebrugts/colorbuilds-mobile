import 'package:colorbuilds/presentation/screens/auth/login/login.dart';
import 'package:colorbuilds/presentation/screens/auth/signup/signup.dart';
import 'package:colorbuilds/presentation/screens/system/welcome.dart';
import 'package:flutter/material.dart';

final Map<String, Widget> appRoutes = {
  '/': WelcomeScreen(),
  '/login': LoginScreen(),
  '/signup': SignupScreen(),
};
