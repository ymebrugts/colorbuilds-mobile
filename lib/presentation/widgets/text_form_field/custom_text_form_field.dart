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
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
  }) : super(key: key);
  final String? labelText;
  final bool? obscureText;
  final Widget? suffixIcon;

  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final InputCounterWidgetBuilder? buildCounter;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle? _textStyle = _themeData.textTheme.bodyText2;

    return TextFormField(
      style: _textStyle,
      autocorrect: false,
      controller: controller,
      obscureText: obscureText!,
      buildCounter: buildCounter,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction ?? TextInputAction.next,
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
