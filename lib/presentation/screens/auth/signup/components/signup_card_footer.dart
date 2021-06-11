import 'package:colorbuilds/presentation/widgets/card/components/custom_card_footer.dart';
import 'package:flutter/material.dart';

class SignupCardFooter extends StatelessWidget {
  const SignupCardFooter({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return CustomCardFooter(
      firstText: 'back',
      secondText: 'create account',
      onPressed: () => Navigator.maybePop(context),
      onSubmit: onSubmit,
    );
  }
}
