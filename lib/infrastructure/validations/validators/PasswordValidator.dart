import 'package:colorbuilds/infrastructure/validations/validators/BaseValidator.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';

class PasswordValidator extends AbstractValidator {
  final String? text;
  late BaseValidator _baseValidator;

  PasswordValidator(this.text) {
    _baseValidator = BaseValidator(text);
  }

  final ValidationType type = ValidationType.Password;

  @override
  String? get validate {
    if (!_baseValidator.regexHasMatch) return _baseValidator.validate;
    if (!regexHasMatch) return ValidationMessages.get(type);
  }

  @override
  bool get regexHasMatch => true;
}
