import 'package:colorbuilds/infrastructure/providers/AssetsPathProvider.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class CustomEmptyMessageWidget extends StatelessWidget {
  const CustomEmptyMessageWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      children: [
        Image.asset(AssetsPathProvider().getDashboard('overlord.jpg'), width: 100),
        customVerticalSpace,
        Text("You don't have $title", style: _themeData.textTheme.bodyText1),
      ],
    );
  }
}
