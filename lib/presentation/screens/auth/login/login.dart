import 'package:colorbuilds/presentation/screens/auth/login/components/login_card_body.dart';
import 'package:colorbuilds/presentation/screens/auth/scaffold/auth_scaffold.dart';
import 'package:colorbuilds/presentation/widgets/card/custom_card_with_header.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Center(
        child: CustomCardWithHeader(
          title: 'Login',
          body: LoginCardBody(),
        ),
      ),
    );
  }
}
