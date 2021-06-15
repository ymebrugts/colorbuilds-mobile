import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders_list_view.dart';
import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_section_title.dart';
import 'package:colorbuilds/presentation/styles/custom_spaces.dart';
import 'package:flutter/material.dart';

class MyBuildsBuildorders extends StatelessWidget {
  const MyBuildsBuildorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MyBuildsSectionTitle('Your Buildorders'),
        customVerticalSpace,
        MyBuildsBuildordersListView(),
      ],
    );
  }
}
