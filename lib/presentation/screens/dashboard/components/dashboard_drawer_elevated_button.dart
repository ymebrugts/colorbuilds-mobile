import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class DashboardDrawerElevatedButton extends StatelessWidget {
  const DashboardDrawerElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 10),
      child: CustomElevatedButton(
        text: text,
        onPressed: onPressed,
        textColor: textColor,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
