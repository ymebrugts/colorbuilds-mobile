import 'package:colorbuilds/infrastructure/actions/auth_actions.dart';
import 'package:colorbuilds/infrastructure/validations/validators/EmailValidator.dart';
import 'package:colorbuilds/infrastructure/validations/validators/UsernameValidator.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_bloc.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_state.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/presentation/screens/auth/signup/components/signup_card_footer.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/text-form-field/custom_email_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text-form-field/custom_password_text_form_field.dart';
import 'package:colorbuilds/presentation/widgets/text-form-field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCardBody extends StatelessWidget {
  SignupCardBody({Key? key, required this.authActions}) : super(key: key);
  final AuthActions authActions;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) {
    HapticFeedback.mediumImpact();
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

  void _checkEmail(BuildContext context, bool hasFocus) {
    if (_emailController.text.isNotEmpty && !hasFocus) {
      authActions.checkEmail(
        bloc: context.read<SignupBloc>(),
        email: _emailController.text,
      );
    }
  }

  void _checkUsername(BuildContext context, bool hasFocus) {
    if (_usernameController.text.isNotEmpty && !hasFocus) {
      authActions.checkUsername(
        bloc: context.read<SignupBloc>(),
        username: _usernameController.text,
      );
    }
  }

  bool _resolveValidationBuildWhen(dynamic _, SignupState state) {
    return state.formStatus is FormValidationFailure || state.formStatus is FormValidationSuccess;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Focus(
            onFocusChange: (hasFocus) => _checkEmail(context, hasFocus),
            child: BlocBuilder<SignupBloc, SignupState>(
              buildWhen: _resolveValidationBuildWhen,
              builder: (context, state) => CustomEmailTextFormField(
                focusNodeContext: context,
                controller: _emailController,
                validator: state.emailExists ? (v) => ExistingEmailValidator().validate : null,
              ),
            ),
          ),
          customVerticalSpace,
          Focus(
            onFocusChange: (hasFocus) => _checkUsername(context, hasFocus),
            child: BlocBuilder<SignupBloc, SignupState>(
              buildWhen: _resolveValidationBuildWhen,
              builder: (context, state) => CustomTextFormField(
                labelText: 'Username',
                controller: _usernameController,
                validator: state.usernameExists ? (v) => ExistingUsernameValidator().validate : null,
              ),
            ),
          ),
          customVerticalSpace,
          CustomPasswordTextFormField(controller: _passwordController),
          customVerticalSpace,
          SignupCardFooter(onSubmit: () => _onSubmit(context)),
        ],
      ),
    );
  }
}
