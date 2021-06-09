import 'package:colorbuilds/infrastructure/providers/AssetsPathProvider.dart';
import 'package:colorbuilds/presentation/styles/custom_paddings.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: deviceWidthHorizontalPadding(context)),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsPathProvider().getBackground('auth.jpg')),
          ),
        ),
        child: child,
      ),
    );
  }
}
