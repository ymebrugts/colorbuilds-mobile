import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app/routes/app_router.dart';
import 'constants/enums.dart';
import 'infrastructure/Mixins/DeviceScreenMixin.dart';
import 'presentation/mts_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();
  late DeviceScreenSize _deviceScreenSize;

  @override
  void initState() {
    super.initState();
    _deviceScreenSize = DeviceScreenSize.Medium;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorBuilds',
      locale: DevicePreview.locale(context),
      theme: MTStheme.customThemeData(_deviceScreenSize),
      onGenerateRoute: (settings) => _appRouter.onGenerateRoute(context, settings),
      builder: (context, widget) {
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) => _deviceScreenSize = DeviceScreenMixin.getDeviceScreenSize(context),
        );

        return widget!;
      },
    );
  }
}
