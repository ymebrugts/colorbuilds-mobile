import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders_list_view_item.dart';
import 'package:flutter/material.dart';

class MyBuildsBuildordersListView extends StatelessWidget {
  const MyBuildsBuildordersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (BuildContext context, int index) {
        return MyBuildsBuildordersListViewItem();
      },
    );
  }
}
