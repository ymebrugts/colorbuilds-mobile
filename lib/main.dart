import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'env.dart';
import 'infrastructure/mixins/AppMixin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(
    DevicePreview(
      enabled: AppMixin.getDevicePreviewStatus(APP_MODE),
      builder: (context) => App(setupConfigurations: () {}),
    ),
  );
}
