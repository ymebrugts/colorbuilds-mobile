import 'package:colorbuilds/presentation/widgets/button/custom_material_button.dart';
import 'package:flutter/material.dart';

class CustomCardFooter extends StatelessWidget {
  const CustomCardFooter({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.onSubmit,
    this.onPressed,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final VoidCallback? onSubmit;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomMaterialButton(
          elevation: 0,
          text: firstText,
          color: Colors.white,
          onPressed: onPressed,
          textColor: _themeData.accentColor,
        ),
        CustomMaterialButton(text: secondText, onPressed: onSubmit),
      ],
    );
  }
}
