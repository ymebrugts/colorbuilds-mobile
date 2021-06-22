import 'package:colorbuilds/logic/auth/login/bloc/login_bloc.dart';
import 'package:colorbuilds/logic/auth/login/bloc/login_state.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/presentation/widgets/card/components/custom_card_footer.dart';
import 'package:colorbuilds/presentation/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCardFooter extends StatelessWidget {
  const LoginCardFooter({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (_, state) => state.formStatus is FormSubmitting || state.formStatus is SubmissionFailure,
      builder: (context, state) {
        final Function()? _onSubmit;
        final CustomCircularProgressIndicator? _secondWidget;

        if (state.formStatus is FormSubmitting) {
          _secondWidget = CustomCircularProgressIndicator(accent: true, size: 15);
          _onSubmit = null;
        } else {
          _secondWidget = null;
          _onSubmit = onSubmit;
        }

        return CustomCardFooter(
          onSubmit: _onSubmit,
          secondText: 'login',
          firstText: 'create account',
          secondWidget: _secondWidget,
          onPressed: () => Navigator.pushNamed(context, '/signup'),
        );
      },
    );
  }
}
