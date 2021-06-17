import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/logic/api_response_status.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorders_list_view_item.dart';
import 'package:colorbuilds/presentation/widgets/indicators/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGuidanceBuildordersListView extends StatelessWidget {
  const ColorGuidanceBuildordersListView({Key? key}) : super(key: key);

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
                itemBuilder: (BuildContext context, int index) {
                  return ColorGuidanceBuildordersListViewItem();
                },
              );
      },
    );
  }
}
