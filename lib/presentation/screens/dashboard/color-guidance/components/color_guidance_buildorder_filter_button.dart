import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../mts_theme.dart';

class ColorGuidanceBuildorderFilterButton extends StatelessWidget {
  const ColorGuidanceBuildorderFilterButton({
    Key? key,
    required this.onSelect,
    required this.selected,
    required this.builderName,
  }) : super(key: key);
  final bool selected;
  final String builderName;
  final Function()? onSelect;
  final Color _darkOrchid = MTStheme.darkOrchid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed: onSelect,
            borderColor: Colors.grey,
            text: 'PvsP | $builderName',
            borderRadius: BorderRadius.circular(100),
            backgroundColor: selected ? _darkOrchid : Colors.white,
            textColor: selected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
