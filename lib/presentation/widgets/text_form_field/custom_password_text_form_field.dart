import 'package:colorbuilds/infrastructure/validations/validators/PasswordValidator.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    Key? key,
    this.controller,
    this.labelText = 'Password',
  }) : super(key: key);
  final String? labelText;
  final TextEditingController? controller;

  @override
  _CustomPasswordTextFormFieldState createState() => _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState extends State<CustomPasswordTextFormField> {
  bool _obscureText = true;

  void _obscure() => setState(() => _obscureText = !_obscureText);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: _obscureText,
      labelText: widget.labelText,
      controller: widget.controller,
      textInputAction: TextInputAction.done,
      validator: (v) => PasswordValidator(v).validate,
      suffixIcon: GestureDetector(onTap: _obscure, child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
      buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => Text(
        currentLength! > 0 ? currentLength.toString() : '',
      ),
    );
  }
}
