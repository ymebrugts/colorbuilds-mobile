import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.icon,
    this.child,
    this.padding,
    this.text = '',
    this.onPressed,
    this.borderRadius,
    this.upperCase = true,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  }) : super(key: key);
  final Widget? child;
  final String? text;
  final bool upperCase;
  final IconData? icon;
  final Color textColor;
  final Color borderColor;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.button!.copyWith(color: textColor);

    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(textColor),
        padding: MaterialStateProperty.all<EdgeInsets>(padding ?? EdgeInsets.all(15)),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.pressed) ? textColor.withOpacity(0.2) : null,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: child ??
          (icon != null
              ? Icon(icon, color: textColor, size: _textStyle.apply(fontSizeDelta: 10).fontSize)
              : Text(upperCase ? text!.toUpperCase() : text.toString(), style: _textStyle)),
    );
  }
}
