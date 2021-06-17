import 'package:colorbuilds/presentation/mts_theme.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildordersListViewItem extends StatelessWidget {
  const ColorGuidanceBuildordersListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.bodyText2!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 5,
        children: [
          RichText(
            text: TextSpan(
              style: _textStyle,
              text: '120 - (220:202020) ',
              children: [
                TextSpan(
                  text: ' Assimilator - Gas',
                  style: _textStyle.apply(color: MTStheme.successColor),
                ),
              ],
            ),
          ),
          Text('Buildorder Name', style: _textStyle.apply(fontWeightDelta: 1)),
        ],
      ),
    );
  }
}
