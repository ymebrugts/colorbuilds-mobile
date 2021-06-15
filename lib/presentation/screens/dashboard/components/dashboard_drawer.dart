import 'package:colorbuilds/presentation/mts_theme.dart';
import 'package:colorbuilds/presentation/screens/dashboard/components/dashboard_drawer_elevated_button.dart';
import 'package:colorbuilds/presentation/screens/dashboard/components/dashboard_drawer_header.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key? key,
    required this.onMyBuilds,
    required this.onColorGuide,
    required this.onAccount,
  }) : super(key: key);
  final Function() onMyBuilds;
  final Function() onColorGuide;
  final Function() onAccount;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    const Color _darkOrchid = MTStheme.darkOrchid;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DashboardDrawerHeader(),
          DashboardDrawerElevatedButton(
            text: 'my builds',
            onPressed: onMyBuilds,
            textColor: Colors.white,
            borderColor: _themeData.primaryColor,
            backgroundColor: _themeData.primaryColor,
          ),
          DashboardDrawerElevatedButton(
            text: 'color guidance',
            onPressed: onColorGuide,
            textColor: Colors.white,
            borderColor: _themeData.primaryColor,
            backgroundColor: _themeData.primaryColor,
          ),
          DashboardDrawerElevatedButton(
            text: 'account',
            onPressed: onAccount,
            textColor: _darkOrchid,
            borderColor: _darkOrchid,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
