import 'package:colorbuilds/domain/data/models/BuildorderRow.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_rows_item_action_rich_text.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildordersRowsListViewItem extends StatelessWidget {
  const ColorGuidanceBuildordersRowsListViewItem({Key? key, required this.row}) : super(key: key);
  final BuildorderRow row;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.bodyText2!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.spaceBetween,
        children: [
          ColorGuidanceBuildordersRowsItemActionRichText(row: row, textStyle: _textStyle),
          Text(row.notes.toString(), style: _textStyle.apply(fontWeightDelta: 1)),
          Divider(),
        ],
      ),
    );
  }
}
