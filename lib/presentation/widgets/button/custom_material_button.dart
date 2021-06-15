import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    Key? key,
    this.child,
    this.color,
    this.padding,
    this.elevation,
    this.textColor,
    this.onPressed,
    this.text = 'Submit',
  }) : super(key: key);
  final String? text;
  final Color? color;
  final Widget? child;
  final Color? textColor;
  final double? elevation;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return MaterialButton(
      minWidth: 0,
      elevation: elevation ?? 3,
      onPressed: onPressed ?? () {},
      textColor: textColor ?? Colors.white,
      color: color ?? _themeData.primaryColor,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
      child: child ?? Text(text!.toUpperCase()),
    );
  }
}
