import 'package:colorbuilds/presentation/screens/auth/login/login.dart';
import 'package:colorbuilds/presentation/screens/auth/signup/signup.dart';
import 'package:colorbuilds/presentation/screens/dashboard/dashboard.dart';
import 'package:colorbuilds/presentation/screens/dashboard/my-builds/my_builds.dart';
import 'package:colorbuilds/presentation/screens/system/welcome.dart';
import 'package:flutter/material.dart';

final Map<String, Widget> appRoutes = {
  '/': WelcomeScreen(),
  '/login': LoginScreen(),
  '/signup': SignupScreen(),
  '/dashboard': DashboardScreen(),
};

final Map<String, Widget> dashboardScreens = {
  'My.Builds': MyBuildsScreen(),
  'Account': Text('account'),
  'Color.Guidance': Text('Color Guidance'),
};
