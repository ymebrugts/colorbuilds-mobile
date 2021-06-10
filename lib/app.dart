import 'package:flutter/material.dart';

import 'app/routes/app_router.dart';
import 'infrastructure/Mixins/DeviceScreenMixin.dart';
import 'presentation/mts_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, constraints) {
        return MaterialApp(
          title: 'ColorBuilds',
          theme: MTStheme.customThemeData(DeviceScreenMixin.getDeviceScreenSize(context)),
          onGenerateRoute: (settings) => _appRouter.onGenerateRoute(context, settings),
        );
      },
    );
  }
}
