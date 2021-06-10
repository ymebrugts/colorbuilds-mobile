import 'package:colorbuilds/presentation/screens/auth/signup/components/signup_card_footer.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_email_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_password_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignupCardBody extends StatelessWidget {
  const SignupCardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomEmailTextFormField(),
        customVerticalSpace,
        CustomTextFormField(labelText: 'username'),
        customVerticalSpace,
        CustomPasswordTextFormField(),
        customVerticalSpace,
        SignupCardFooter(),
      ],
    );
  }
}
