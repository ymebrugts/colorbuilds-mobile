import 'package:colorbuilds/app/routes/app_routes.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/dashboard/layout/dashboard_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  void _resolveListener(BuildContext context, SessionState state) {
    if (state is UnauthenticatedSession) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: _resolveListener,
      child: DashboardScaffold(dashboardScreens: dashboardScreens),
    );
  }
}
