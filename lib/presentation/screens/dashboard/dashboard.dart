import 'package:colorbuilds/app/routes/app_routes.dart';
import 'package:colorbuilds/presentation/screens/dashboard/layout/dashboard_scaffold.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(dashboardScreens: dashboardScreens);
  }
}
