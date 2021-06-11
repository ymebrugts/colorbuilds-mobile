import 'package:colorbuilds/infrastructure/actions/auth_actions.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/presentation/screens/auth/login/components/login_card_footer.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_email_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text_form_field/custom_password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCardBody extends StatelessWidget {
  LoginCardBody({Key? key, required this.authActions}) : super(key: key);
  final AuthActions authActions;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      authActions.login(
        bloc: context.read<LoginBloc>(),
        email: _emailController.text,
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
          CustomEmailTextFormField(focusNodeContext: context, controller: _emailController),
          customVerticalSpace,
          CustomPasswordTextFormField(controller: _passwordController),
          customVerticalSpace,
          LoginCardFooter(onSubmit: () => _onSubmit(context)),
        ],
      ),
    );
  }
}
