import 'package:colorbuilds/presentation/widgets/card/components/custom_card_header.dart';
import 'package:flutter/material.dart';

class CustomCardWithHeader extends StatelessWidget {
  const CustomCardWithHeader({Key? key, required this.title, required this.body}) : super(key: key);
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 15, vertical: 20);

    return Card(
      color: _themeData.cardColor,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCardHeader(title: title, padding: _padding),
            Padding(padding: _padding, child: body),
          ],
        ),
      ),
    );
  }
}
