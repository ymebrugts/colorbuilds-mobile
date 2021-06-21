import 'package:colorbuilds/domain/data/models/BuildorderRow.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_rows_item_action_rich_text.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildordersRowsListViewItem extends StatelessWidget {
  const ColorGuidanceBuildordersRowsListViewItem({Key? key, required this.row, required this.isLast}) : super(key: key);
  final bool isLast;
  final BuildorderRow row;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.bodyText2!;

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ColorGuidanceBuildordersRowsItemActionRichText(row: row, textStyle: _textStyle),
        if (row.notes!.isNotEmpty) Text(row.notes.toString(), style: _textStyle.apply(fontWeightDelta: 1)),
        if (!isLast) Divider(height: 20),
      ],
    );
  }
}
