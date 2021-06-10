import 'package:colorbuilds/infrastructure/validations/validators/BaseValidator.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.validator,
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
  final FormFieldValidator<String>? validator;

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ?? (v) => BaseValidator(v).validate,
    );
  }
}
