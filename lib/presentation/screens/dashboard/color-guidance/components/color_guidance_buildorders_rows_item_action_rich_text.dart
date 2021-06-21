import 'package:colorbuilds/domain/data/models/BuildorderRow.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/helpers/action_helper.dart';
import 'package:flutter/material.dart';

import '../../../../mts_theme.dart';

class ColorGuidanceBuildordersRowsItemActionRichText extends StatelessWidget {
  const ColorGuidanceBuildordersRowsItemActionRichText({Key? key, required this.row, required this.textStyle})
      : super(key: key);
  final BuildorderRow row;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final ActionHelper _actionHelper = ActionHelper();

    return RichText(
      text: TextSpan(
        style: textStyle,
        text: '${row.supply} - (${row.minutes}:${row.seconds}) - ${row.getResourcesString} ',
        children: row.actions
            .map(
              (action) => TextSpan(
                text: (action.amount > 1 ? '${action.amount.floor()}x ' : '') + action.action,
                style: textStyle.apply(color: _actionHelper.getActionColorByType(action.type)),
                children: [
                  ///
                  if (action.amountChrono > 1)
                    TextSpan(
                      text: ' (${action.amountChrono.floor()}x Chrono) ',
                      style: textStyle.apply(color: MTStheme.successColor),
                    )
                  else
                    TextSpan(),

                  ///
                  if (row.actions.last != action) TextSpan(text: ' + ', style: textStyle) else TextSpan(),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
