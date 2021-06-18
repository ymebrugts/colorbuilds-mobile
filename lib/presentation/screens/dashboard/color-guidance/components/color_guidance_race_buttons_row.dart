import 'dart:ui';

import 'package:colorbuilds/infrastructure/providers/AssetsPathProvider.dart';
import 'package:colorbuilds/presentation/mts_theme.dart';
import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColorGuidanceRaceButtonsRow extends StatelessWidget {
  const ColorGuidanceRaceButtonsRow({Key? key, required this.selectRace, required this.selectedRace}) : super(key: key);
  final Function(String race) selectRace;
  final String? selectedRace;

  final Color _darkOrchid = MTStheme.darkOrchid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            textColor: Colors.grey,
            borderColor: Colors.grey,
            onPressed: () => selectRace('Terran'),
            backgroundColor: selectedRace == 'Terran' ? _darkOrchid : Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            child: Image.asset(AssetsPathProvider().getDashboard('terran.png')),
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
            textColor: Colors.grey,
            icon: Icons.dining_sharp,
            borderColor: Colors.grey,
            borderRadius: BorderRadius.zero,
            onPressed: () => selectRace('Protoss'),
            backgroundColor: selectedRace == 'Protoss' ? _darkOrchid : Colors.white,
            child: Image.asset(AssetsPathProvider().getDashboard('protoss.png')),
          ),
        ),
        Expanded(
          child: CustomElevatedButton(
            textColor: Colors.grey,
            icon: Icons.dining_sharp,
            borderColor: Colors.grey,
            onPressed: () => selectRace('Zerg'),
            backgroundColor: selectedRace == 'Zerg' ? _darkOrchid : Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
            child: Image.asset(AssetsPathProvider().getDashboard('zerg.png')),
          ),
        )
      ],
    );
  }
}
