import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

import 'components/color_guidance_race_buttons_row.dart';

class ColorGuidanceScreen extends StatelessWidget {
  const ColorGuidanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text('My Buildorder', style: _themeData.textTheme.bodyText1?.apply(fontWeightDelta: 3)),
          customVerticalSpace,
          ColorGuidanceRaceButtonsRow(),
          customVerticalSpace,
          Text('VS', style: _themeData.textTheme.headline6),
          customVerticalSpace,
          ColorGuidanceRaceButtonsRow(),
        ],
      ),
    );
  }
}
