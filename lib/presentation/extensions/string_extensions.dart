class StringExtensions {}

extension BoolParsing on String {
  bool get parseBool => toLowerCase() == 'true';
}
