import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders_item_actions_single_scroll_view.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class MyBuildsBuildordersListViewItem extends StatelessWidget {
  const MyBuildsBuildordersListViewItem({Key? key, required this.buildorder}) : super(key: key);
  final Buildorder buildorder;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade400, offset: Offset(0, 1), blurRadius: 2)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                buildorder.name == '' ? 'Unnamed Buildorder' : buildorder.name,
                style: _themeData.textTheme.bodyText1?.apply(fontWeightDelta: 2),
              ),
              SizedBox(height: 5),
              Text('Protoss vs Protoss', style: _themeData.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold)),
              customVerticalSpace,
              MyBuildsBuildordersItemActionsSingleScrollView(),
            ],
          ),
          customVerticalSpace,
        ],
      ),
    );
  }
}
