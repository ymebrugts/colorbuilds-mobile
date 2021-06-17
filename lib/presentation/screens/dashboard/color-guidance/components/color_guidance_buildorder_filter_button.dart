import 'package:colorbuilds/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColorGuidanceBuildorderFilterButton extends StatelessWidget {
  const ColorGuidanceBuildorderFilterButton({Key? key, required this.builderName}) : super(key: key);
  final String builderName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            borderColor: Colors.grey,
            backgroundColor: Colors.white,
            textColor: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(100),
            text: 'PvsP | $builderName',
          ),
        ),
      ],
    );
  }
}
