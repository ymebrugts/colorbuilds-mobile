import 'package:flutter/material.dart';

/// Padding according to device width
///
/// Returns [DeviceScreenWidth * 0.15]
double deviceWidthHorizontalPadding(BuildContext context) => MediaQuery.of(context).size.width * 0.1;
