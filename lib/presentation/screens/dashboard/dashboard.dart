import 'package:colorbuilds/app/routes/app_routes.dart';
import 'package:colorbuilds/infrastructure/services/auth/auth_analytics_service.dart';
import 'package:colorbuilds/logic/buildorders/api_buildorders_repository.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/dashboard/layout/dashboard_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final AuthAnalyticsService _authAnalyticsService = AuthAnalyticsService();

  @override
  void initState() {
    super.initState();
    _logUserLoginEvent(context);
  }

  void _logUserLoginEvent(BuildContext context) {
    final _authState = context.read<SessionCubit>().state as AuthenticatedSession;

    _authAnalyticsService.logLogin(
      email: _authState.user.email.toString(),
      username: _authState.user.username.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiBuildOrdersRepository(),
      child: BlocProvider(
        create: (context) => BuildordersBloc(
          storage: _storage,
          buildOrdersRepository: context.read<ApiBuildOrdersRepository>(),
        ),
        child: DashboardScaffold(dashboardScreens: dashboardScreens),
      ),
    );
  }
}
