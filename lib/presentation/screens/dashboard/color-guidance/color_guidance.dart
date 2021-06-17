import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_filter_list_view.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_list_view.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_race_filter_section.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class ColorGuidanceScreen extends StatelessWidget {
  const ColorGuidanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Text('My Buildorder', style: _themeData.textTheme.bodyText1?.apply(fontWeightDelta: 3)),
          ColorGuidanceRaceFilterSection(),
          customVerticalSpace,
          customVerticalSpace,
          ColorGuidanceBuildordersFilterListView(),
          Divider(),
          ColorGuidanceBuildordersListView(),
        ],
      ),
    );
  }
}
