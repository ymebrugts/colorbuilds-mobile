import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class CustomFailureMessageWidget extends StatelessWidget {
  const CustomFailureMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: _themeData.primaryColor,
            size: _themeData.textTheme.headline1!.fontSize! + 40,
          ),
          customVerticalSpace,
          Text('Something went wrong!', style: _themeData.textTheme.bodyText1)
        ],
      ),
    );
  }
}
