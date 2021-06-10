import 'package:colorbuilds/infrastructure/validations/validators/EmailValidator.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({
    Key? key,
    this.controller,
    this.labelText = 'Email',
  }) : super(key: key);
  final String? labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      controller: controller,
      validator: (v) => EmailValidator(v).validate,
    );
  }
}
