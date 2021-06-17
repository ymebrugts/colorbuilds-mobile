import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_race_buttons_row.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class ColorGuidanceRaceFilterSection extends StatelessWidget {
  const ColorGuidanceRaceFilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      children: [
        customVerticalSpace,
        ColorGuidanceRaceButtonsRow(),
        customVerticalSpace,
        Text('VS', style: _themeData.textTheme.headline6),
        customVerticalSpace,
        ColorGuidanceRaceButtonsRow(),
      ],
    );
  }
}
