import 'package:flutter/material.dart';

class ActionHelper {
  final List<Map<String, Object>> _actionTypeColors = [
    {
      'type': 'BUILDING',
      'color': 0xFF0070c0,
    },
    {
      'type': 'UNIT',
      'color': 0xFFc000ad,
    },
    {
      'type': 'UPGRADE',
      'color': 0xFF996633,
    },
    {
      'type': 'SUPPLY',
      'color': 0xFFe0ac00,
    },
    {
      'type': 'HERO',
      'color': 0xFFe00000,
    },
    {
      'type': 'GAS',
      'color': 0xFF00d615,
    },
    {
      'type': 'ABILITY',
      'color': 0xFF6e00d4,
    },
    {
      'type': 'BASE',
      'color': 0xFF0070c0,
    },
    {
      'type': 'CHRONO',
      'color': 0xFF00e08e,
    },
    {
      'type': 'SCOUT',
      'color': 0xFFff8ab3,
    },
    {
      'type': 'HARASS',
      'color': 0xFFff5400,
    },
    {
      'type': 'ATTACK',
      'color': 0xFFff0000,
    },
    {
      'type': 'CUSTOMTYPE1',
      'color': 0xFF00e08e,
    },
    {
      'type': 'CUSTOMTYPE2',
      'color': 0xFF00e08e,
    },
    {
      'type': 'CUSTOMTYPE3',
      'color': 0xFF00e08e,
    },
    {
      'type': 'CUSTOMTYPE4',
      'color': 0xFF00e08e,
    },
    {
      'type': 'CUSTOMTYPE5',
      'color': 0xFF00e08e,
    }
  ];

  Color getActionColorByType(String type) {
    return Color(
      int.parse(
        _actionTypeColors.where((e) => e['type'] == type).first['color'].toString(),
      ),
    );
  }
}
