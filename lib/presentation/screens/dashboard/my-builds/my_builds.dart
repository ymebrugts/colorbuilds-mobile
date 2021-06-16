import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders.dart';
import 'package:flutter/material.dart';

class MyBuildsScreen extends StatelessWidget {
  const MyBuildsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyBuildsBuildorders(),
    );
  }
}
