import 'package:colorbuilds/presentation/widgets/button/custom_material_button.dart';
import 'package:flutter/material.dart';

class LoginCardFooter extends StatelessWidget {
  const LoginCardFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomMaterialButton(
          elevation: 0,
          color: Colors.white,
          text: 'create account',
          textColor: _themeData.accentColor,
        ),
        CustomMaterialButton(text: 'login'),
      ],
    );
  }
}
