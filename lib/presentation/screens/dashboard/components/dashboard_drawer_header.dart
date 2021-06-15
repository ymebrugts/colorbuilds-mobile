import 'package:flutter/material.dart';

class DashboardDrawerHeader extends StatelessWidget {
  const DashboardDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Container(
      height: 150,
      child: DrawerHeader(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: _themeData.primaryColor),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ColorBuilds',
            style: _themeData.textTheme.headline6?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
