import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../mts_theme.dart';

class ColorGuidanceBuildorderFilterButton extends StatelessWidget {
  const ColorGuidanceBuildorderFilterButton({
    Key? key,
    required this.onSelect,
    required this.selected,
    required this.buildorder,
  }) : super(key: key);
  final bool selected;
  final Buildorder buildorder;
  final Function()? onSelect;
  final Color _darkOrchid = MTStheme.darkOrchid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            upperCase: false,
            onPressed: onSelect,
            borderColor: Colors.grey,
            borderRadius: BorderRadius.circular(100),
            backgroundColor: selected ? _darkOrchid : Colors.white,
            textColor: selected ? Colors.white : Colors.grey.shade700,
            text:
                '${buildorder.getYourRace?.substring(0, 1)}vs${buildorder.getOpponentRace?.substring(0, 1)} | ${buildorder.name.toUpperCase()}',
          ),
        ),
      ],
    );
  }
}
