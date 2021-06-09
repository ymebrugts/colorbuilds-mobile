import 'package:flutter/material.dart';

class CustomCardHeader extends StatelessWidget {
  const CustomCardHeader({Key? key, required this.title, required this.padding}) : super(key: key);
  final String title;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Container(
      padding: padding,
      width: double.infinity,
      color: _themeData.primaryColor,
      child: Text(title, style: _themeData.textTheme.bodyText1?.copyWith(color: Colors.white)),
    );
  }
}
