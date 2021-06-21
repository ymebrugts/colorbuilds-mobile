import 'package:colorbuilds/logic/session/bloc/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app/routes/app_router.dart';
import 'infrastructure/Mixins/DeviceScreenMixin.dart';
import 'logic/auth/api_auth_repository.dart';
import 'logic/auth/login/bloc/login_bloc.dart';
import 'presentation/mts_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiAuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SessionCubit()),
          BlocProvider(
            create: (context) => LoginBloc(
              authRepo: context.read<ApiAuthRepository>(),
              sessionCubit: context.read<SessionCubit>(),
              storage: FlutterSecureStorage(),
            ),
          ),
        ],
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
