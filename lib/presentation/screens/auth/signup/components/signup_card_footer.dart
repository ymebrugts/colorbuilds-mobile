import 'package:colorbuilds/logic/auth/signup/bloc/signup_bloc.dart';
import 'package:colorbuilds/logic/auth/signup/bloc/signup_state.dart';
import 'package:colorbuilds/logic/form_submission_status.dart';
import 'package:colorbuilds/presentation/widgets/card/components/custom_card_footer.dart';
import 'package:colorbuilds/presentation/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCardFooter extends StatelessWidget {
  const SignupCardFooter({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
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
          firstText: 'back',
          secondWidget: _secondWidget,
          secondText: 'create account',
          onPressed: () => Navigator.maybePop(context),
        );
      },
    );
  }
}
