import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/color-guidance/components/color_guidance_buildorder_filter_button.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGuidanceBuildordersFilterListView extends StatelessWidget {
  const ColorGuidanceBuildordersFilterListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildordersBloc, BuildordersState>(
      builder: (context, state) {
        final List<Buildorder> items = state.buildorders;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int i) => Column(
            children: [ColorGuidanceBuildorderFilterButton(builderName: items[i].name), customVerticalSpace],
          ),
        );
      },
    );
  }
}
