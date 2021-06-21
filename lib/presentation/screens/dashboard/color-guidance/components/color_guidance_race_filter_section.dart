import 'package:colorbuilds/infrastructure/actions/buildorders_actions.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_race_buttons_row.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGuidanceRaceFilterSection extends StatefulWidget {
  const ColorGuidanceRaceFilterSection({Key? key}) : super(key: key);

  @override
  _ColorGuidanceRaceFilterSectionState createState() => _ColorGuidanceRaceFilterSectionState();
}

class _ColorGuidanceRaceFilterSectionState extends State<ColorGuidanceRaceFilterSection> {
  String? _yourRace;
  String? _opponentRace;
  final BuildordersActions _buildordersActions = BuildordersActions();

  void _selectYourRace(BuildContext context, String? race) {
    HapticFeedback.mediumImpact();
    setState(() => _yourRace != race ? _yourRace = race : _yourRace = null);
    _filterByRace();
  }

  void _selectOpponentRace(BuildContext context, String? race) {
    HapticFeedback.mediumImpact();
    setState(() => _opponentRace != race ? _opponentRace = race : _opponentRace = null);
    _filterByRace();
  }

  void _filterByRace() {
    _buildordersActions.filterByRace(
      yourRace: _yourRace,
      opponentRace: _opponentRace,
      bloc: context.read<BuildordersBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      children: [
        customVerticalSpace,
        ColorGuidanceRaceButtonsRow(
          selectedRace: _yourRace,
          selectRace: (String race) => _selectYourRace(context, race),
        ),
        customVerticalSpace,
        Text('VS', style: _themeData.textTheme.headline6),
        customVerticalSpace,
        ColorGuidanceRaceButtonsRow(
          selectedRace: _opponentRace,
          selectRace: (String race) => _selectOpponentRace(context, race),
        ),
      ],
    );
  }
}
