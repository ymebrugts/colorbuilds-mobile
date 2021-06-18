import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/infrastructure/actions/buildorders_actions.dart';
import 'package:colorbuilds/logic/api_response_status.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_filter_list_view.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_rows_list_view.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_race_filter_section.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGuidanceScreen extends StatefulWidget {
  const ColorGuidanceScreen({Key? key}) : super(key: key);

  @override
  _ColorGuidanceScreenState createState() => _ColorGuidanceScreenState();
}

class _ColorGuidanceScreenState extends State<ColorGuidanceScreen> {
  final BuildordersActions _buildordersActions = BuildordersActions();

  @override
  void initState() {
    super.initState();
    _buildordersActions.index(bloc: context.read<BuildordersBloc>());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<BuildordersBloc, BuildordersState>(
            builder: (_, state) => state.filtered.length == 1
                ? Text(state.filtered.first.name, style: _themeData.textTheme.bodyText1?.apply(fontWeightDelta: 3))
                : SizedBox(),
          ),
          ColorGuidanceRaceFilterSection(),
          customVerticalSpace,
          customVerticalSpace,
          BlocBuilder<BuildordersBloc, BuildordersState>(
            builder: (context, state) =>
                state.filtered.isNotEmpty ? ColorGuidanceBuildordersFilterListView() : SizedBox(),
          ),
          Divider(),
          SizedBox(height: 5),
          BlocBuilder<BuildordersBloc, BuildordersState>(
            builder: (context, state) {
              final List<Buildorder> items = state.filtered;

              if (items.length == 1) {
                if (state.apiResponseStatus is ApiResponseStatusInProgress) return CustomCircularProgressIndicator();
                return ColorGuidanceBuildordersRowsListView(rows: items.first.rows ?? []);
              }
              return SizedBox();
            },
          ),
          BlocBuilder<BuildordersBloc, BuildordersState>(
            builder: (_, state) => state.filtered.length == 1
                ? Text(
                    state.filtered.first.endOfBoNotes.toString(),
                    style: _themeData.textTheme.bodyText2?.apply(fontWeightDelta: 3),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
