import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
    this.size,
    this.accent = false,
  }) : super(key: key);
  final bool? accent;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(color: accent! ? _themeData.canvasColor : null),
      ),
    );
  }
}
