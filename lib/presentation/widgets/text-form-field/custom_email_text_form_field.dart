import 'package:colorbuilds/infrastructure/validations/validators/EmailValidator.dart';
import 'package:colorbuilds/presentation/widgets/text-form-field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({
    Key? key,
    this.validator,
    this.controller,
    this.focusNodeContext,
    this.labelText = 'Email',
  }) : super(key: key);
  final String? labelText;
  final BuildContext? focusNodeContext;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      controller: controller,
      validator: validator ?? (v) => EmailValidator(v).validate,
      onFieldSubmitted: (_) => FocusScope.of(focusNodeContext ?? context).nextFocus(),
    );
  }
}
