import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routes/app_router.dart';
import 'infrastructure/Mixins/DeviceScreenMixin.dart';
import 'logic/auth/api_auth_repository.dart';
import 'presentation/mts_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiAuthRepository(),
      child: BlocProvider(
        create: (context) => SessionCubit(),
        child: MaterialApp(
          builder: (context, constraints) {
            return MaterialApp(
              title: 'ColorBuilds',
              theme: MTStheme.customThemeData(DeviceScreenMixin.getDeviceScreenSize(context)),
              onGenerateRoute: (settings) => _appRouter.onGenerateRoute(context, settings),
            );
          },
        ),
      ),
    );
  }
}
