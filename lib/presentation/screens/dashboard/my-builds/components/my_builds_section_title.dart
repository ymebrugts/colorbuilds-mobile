import 'package:flutter/material.dart';

class MyBuildsSectionTitle extends StatelessWidget {
  const MyBuildsSectionTitle(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme _themeData = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: _themeData.bodyText1?.copyWith(fontWeight: FontWeight.w600)),
        Divider(),
      ],
    );
  }
}
