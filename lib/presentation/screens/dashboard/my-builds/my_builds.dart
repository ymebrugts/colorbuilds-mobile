import 'package:colorbuilds/infrastructure/actions/buildorders_actions.dart';
import 'package:colorbuilds/logic/buildorders/bloc/buildorders_bloc.dart';
import 'package:colorbuilds/presentation/screens/dashboard/my-builds/components/my_builds_buildorders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBuildsScreen extends StatefulWidget {
  const MyBuildsScreen({Key? key}) : super(key: key);

  @override
  _MyBuildsScreenState createState() => _MyBuildsScreenState();
}

class _MyBuildsScreenState extends State<MyBuildsScreen> {
  final BuildordersActions _buildordersActions = BuildordersActions();

  @override
  void initState() {
    super.initState();
    _buildordersActions.index(bloc: context.read<BuildordersBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MyBuildsBuildorders(),
    );
  }
}
