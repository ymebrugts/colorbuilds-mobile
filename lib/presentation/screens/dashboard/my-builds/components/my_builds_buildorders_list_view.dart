import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBuildsBuildordersListView extends StatelessWidget {
  const MyBuildsBuildordersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildordersBloc, BuildordersState>(
      builder: (context, state) {
        final List<Buildorder> items = state.buildorders;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (BuildContext context, int i) {
            return MyBuildsBuildordersListViewItem(buildorder: items[i]);
          },
        );
      },
    );
  }
}
