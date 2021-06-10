import 'package:colorbuilds/infrastructure/providers/AssetsPathProvider.dart';
import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/auth/scaffold/auth_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _resolveNavigation(context, context.read<SessionCubit>().state);
  }

  void _resolveNavigation(BuildContext context, SessionState state) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      if (state is InitialSession) Navigator.of(context).pushNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: _resolveNavigation,
      child: AuthScaffold(
        child: Center(
          child: SvgPicture.asset(
            AssetsPathProvider().getCompany('logo.svg'),
          ),
        ),
      ),
    );
  }
}
