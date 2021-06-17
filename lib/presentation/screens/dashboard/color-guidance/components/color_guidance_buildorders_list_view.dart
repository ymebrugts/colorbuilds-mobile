import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_list_view_item.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildordersListView extends StatelessWidget {
  const ColorGuidanceBuildordersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ColorGuidanceBuildordersListViewItem();
      },
    );
  }
}
