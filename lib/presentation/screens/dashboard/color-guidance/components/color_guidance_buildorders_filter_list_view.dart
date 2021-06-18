import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/infrastructure/actions/buildorders_actions.dart';
import 'package:colorbuilds/logic/api_response_status.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorder_filter_button.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:colorbuilds/presentation/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGuidanceBuildordersFilterListView extends StatefulWidget {
  const ColorGuidanceBuildordersFilterListView({Key? key}) : super(key: key);

  @override
  _ColorGuidanceBuildordersFilterListViewState createState() => _ColorGuidanceBuildordersFilterListViewState();
}

class _ColorGuidanceBuildordersFilterListViewState extends State<ColorGuidanceBuildordersFilterListView> {
  String? _selectedName;
  final BuildordersActions _buildordersActions = BuildordersActions();

  void _filterByName(String name) {
    setState(() => _selectedName != name ? _selectedName = name : _selectedName = null);
    _buildordersActions.filterByName(bloc: context.read<BuildordersBloc>(), name: _selectedName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildordersBloc, BuildordersState>(
      builder: (context, state) {
        final List<Buildorder> items = state.buildorders;

        return state.apiResponseStatus is ApiResponseStatusInProgress
            ? CustomCircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int i) => Column(
                  children: [
                    customVerticalSpace,
                    ColorGuidanceBuildorderFilterButton(
                      builderName: items[i].name,
                      selected: items[i].name == _selectedName,
                      onSelect: () => _filterByName(items[i].name),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
