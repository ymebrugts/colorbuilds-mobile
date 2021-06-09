import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.suffixIcon,
    this.controller,
    this.buildCounter,
    this.obscureText = false,
  }) : super(key: key);
  final String? labelText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final InputCounterWidgetBuilder? buildCounter;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle? _textStyle = _themeData.textTheme.bodyText2;

    return TextFormField(
      style: _textStyle,
      controller: controller,
      obscureText: obscureText!,
      buildCounter: buildCounter,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
