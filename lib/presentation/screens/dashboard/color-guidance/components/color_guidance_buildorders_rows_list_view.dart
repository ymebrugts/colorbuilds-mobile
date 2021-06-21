import 'package:colorbuilds/domain/data/models/BuildorderRow.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_rows_list_view_item.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildordersRowsListView extends StatelessWidget {
  const ColorGuidanceBuildordersRowsListView({Key? key, required this.rows}) : super(key: key);
  final List<BuildorderRow> rows;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: rows.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return ColorGuidanceBuildordersRowsListViewItem(row: rows[i], isLast: rows.length == i + 1);
      },
    );
  }
}
