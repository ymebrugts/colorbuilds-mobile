import 'package:colorbuilds/infrastructure/actions/auth_actions.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_bloc.dart';
import 'package:colorbuilds/presentation/screens/auth/signup/components/signup_card_footer.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_email_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_password_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCardBody extends StatelessWidget {
  SignupCardBody({Key? key, required this.authActions}) : super(key: key);
  final AuthActions authActions;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      authActions.signup(
        bloc: context.read<SignupBloc>(),
        email: _emailController.text,
        username: _usernameController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomEmailTextFormField(controller: _emailController),
          customVerticalSpace,
          CustomTextFormField(controller: _usernameController, labelText: 'username'),
          customVerticalSpace,
          CustomPasswordTextFormField(controller: _passwordController),
          customVerticalSpace,
          SignupCardFooter(onSubmit: () => _onSubmit(context)),
        ],
      ),
    );
  }
}
