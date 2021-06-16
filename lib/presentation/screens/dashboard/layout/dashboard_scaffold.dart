import 'package:colorbuilds/infrastructure/actions/session_actions.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/dashboard/components/dashboard_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashboardScaffold extends StatefulWidget {
  const DashboardScaffold({Key? key, required this.dashboardScreens}) : super(key: key);
  final Map<String, Widget> dashboardScreens;

  @override
  _DashboardScaffoldState createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  late Widget _body = SizedBox();
  late String _title = 'ColorBuilds';
  final SessionActions _sessionActions = SessionActions();

  @override
  void initState() {
    super.initState();
    _title = 'My Builds';
    _body = widget.dashboardScreens['My.Builds']!;
  }

  void _logout(SessionCubit cubit) {
    _sessionActions.unauthenticate(cubit: cubit);
  }

  void _navigate(String screenName) {
    setState(() {
      _title = screenName.replaceAll('.', ' ');
      _body = widget.dashboardScreens[screenName] ?? SizedBox();
    });
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20), child: _body),
      appBar: AppBar(title: Text(_title)),
      drawer: DashboardDrawer(
        onMyBuilds: () => _navigate('My.Builds'),
        onColorGuide: () => _navigate('Color.Guidance'),
        onLogout: () => _logout(context.read<SessionCubit>()),
      ),
    );
  }
}
