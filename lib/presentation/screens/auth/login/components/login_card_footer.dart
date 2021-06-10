import 'package:colorbuilds/presentation/widgets/card/components/custom_card_footer.dart';
import 'package:flutter/material.dart';

class LoginCardFooter extends StatelessWidget {
  const LoginCardFooter({Key? key, required this.onSubmit}) : super(key: key);
  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return CustomCardFooter(
      firstText: 'create account',
      secondText: 'login',
      onSubmit: onSubmit,
      onPressed: () => Navigator.pushNamed(context, '/signup'),
    );
  }
}
