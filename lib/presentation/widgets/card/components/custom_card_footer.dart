import 'package:colorbuilds/presentation/widgets/button/custom_material_button.dart';
import 'package:flutter/material.dart';

class CustomCardFooter extends StatelessWidget {
  const CustomCardFooter({
    Key? key,
    this.onSubmit,
    this.onPressed,
    this.firstWidget,
    this.secondWidget,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final Widget? firstWidget;
  final Widget? secondWidget;
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
          child: firstWidget,
        ),
        CustomMaterialButton(
          text: secondText,
          onPressed: onSubmit,
          child: secondWidget,
        ),
      ],
    );
  }
}
