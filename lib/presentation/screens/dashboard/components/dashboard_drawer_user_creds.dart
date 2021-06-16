import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:colorbuilds/presentation/screens/dashboard/components/dashboard_drawer_user_cred_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardDrawerUserCreds extends StatelessWidget {
  const DashboardDrawerUserCreds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 10),
      child: BlocBuilder<SessionCubit, SessionState>(
        buildWhen: (_, state) => state is AuthenticatedSession,
        builder: (context, state) {
          final _authState = state as AuthenticatedSession;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardDrawerUserCredRow(icon: Icons.person, text: _authState.user.username.toString()),
              DashboardDrawerUserCredRow(icon: Icons.email, text: _authState.user.email.toString()),
            ],
          );
        },
      ),
    );
  }
}
