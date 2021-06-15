import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../mts_theme.dart';

class MyBuildsBuildordersItemActionsSingleScrollView extends StatelessWidget {
  const MyBuildsBuildordersItemActionsSingleScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final Color _darkOrchid = MTStheme.darkOrchid;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10,
        children: [
          CustomElevatedButton(
            backgroundColor: Colors.white,
            icon: Icons.cloud_upload_rounded,
            textColor: _themeData.accentColor,
            borderColor: _themeData.accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          CustomElevatedButton(
            icon: Icons.edit,
            backgroundColor: Colors.white,
            textColor: _themeData.accentColor,
            borderColor: _themeData.accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          CustomElevatedButton(
            icon: Icons.close,
            textColor: _darkOrchid,
            borderColor: _darkOrchid,
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          CustomElevatedButton(
            backgroundColor: Colors.white,
            icon: Icons.upload_file_outlined,
            textColor: _themeData.accentColor,
            borderColor: _themeData.accentColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ],
      ),
    );
  }
}
