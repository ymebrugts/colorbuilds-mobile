import 'package:colorbuilds/app/routes/app_routes.dart';
import 'package:colorbuilds/logic/buildorders/api_buildorders_repository.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/layout/dashboard_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final FlutterSecureStorage _storage = FlutterSecureStorage();

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
