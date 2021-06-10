import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class CustomSnackbars {
  final BuildContext context;
  final Duration _duration = Duration(seconds: 1);

  CustomSnackbars(this.context);

  void showUnexpectedSnackbar() => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: _duration, content: Text('Something went wrong!')),
      );

  void showErrorMessageSnackbar(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: _duration,
          backgroundColor: Theme.of(context).accentColor,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.white),
                customHorizontalSpace,
                Text(message),
              ],
            ),
          ),
        ),
      );

  void showSuccessMessageSnackbar(String message) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: _duration,
          backgroundColor: Theme.of(context).primaryColor,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.check_box, color: Colors.white),
                customHorizontalSpace,
                Text(message),
              ],
            ),
          ),
        ),
      );
}
