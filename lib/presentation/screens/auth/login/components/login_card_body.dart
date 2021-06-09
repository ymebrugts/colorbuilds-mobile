import 'package:colorbuilds/presentation/screens/auth/login/components/login_card_footer.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_password_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginCardBody extends StatelessWidget {
  LoginCardBody({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(labelText: 'Email'),
        customVerticalSpace,
        CustomPasswordTextFormField(controller: _passwordController),
        customVerticalSpace,
        LoginCardFooter(),
      ],
    );
  }
}
