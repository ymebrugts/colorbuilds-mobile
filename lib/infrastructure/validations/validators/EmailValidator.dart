import 'package:colorbuilds/infrastructure/validations/validators/BaseValidator.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';
import '../ValidationRegexes.dart';

class EmailValidator extends AbstractValidator {
  final String? text;
  late BaseValidator _baseValidator;

  EmailValidator(this.text) {
    _baseValidator = BaseValidator(text);
  }

  final ValidationType type = ValidationType.Email;

  @override
  String? get validate {
    if (!_baseValidator.regexHasMatch) return _baseValidator.validate;
    if (!regexHasMatch) return ValidationMessages.get(type);
  }

  @override
  bool get regexHasMatch => RegExp(ValidationRegexes.get(type)).hasMatch(text!);
}
