import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'env.dart';
import 'infrastructure/mixins/AppMixin.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: AppMixin.getDevicePreviewStatus(APP_MODE),
      builder: (context) => App(setupConfigurations: () {}),
    ),
  );
}
