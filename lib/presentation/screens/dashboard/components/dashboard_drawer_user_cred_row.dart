import 'package:flutter/material.dart';

class DashboardDrawerUserCredRow extends StatelessWidget {
  const DashboardDrawerUserCredRow({Key? key, required this.icon, required this.text}) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      children: [
        Icon(icon, color: _themeData.primaryColor),
        SizedBox(width: 10),
        Text(text, style: _themeData.textTheme.bodyText2),
      ],
    );
  }
}
