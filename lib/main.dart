import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'env.dart';
import 'infrastructure/mixins/AppMixin.dart';
import 'presentation/mts_theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: AppMixin.getDevicePreviewStatus(APP_MODE),
      builder: (context) => AppOriginator(),
    ),
  );
}

class AppOriginator extends StatefulWidget {
  const AppOriginator({Key? key}) : super(key: key);
  @override
  _AppOriginatorState createState() => _AppOriginatorState();
}

class _AppOriginatorState extends State<AppOriginator> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: MTStheme.primaryColor,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return App();
  }
}
