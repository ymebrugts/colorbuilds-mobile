import 'package:colorbuilds/infrastructure/validations/validators/BaseValidator.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';

class UsernameValidator extends AbstractValidator {
  final String? text;
  late BaseValidator _baseValidator;

  UsernameValidator(this.text) {
    _baseValidator = BaseValidator(text);
  }

  final ValidationType type = ValidationType.Username;

  @override
  String? get validate {
    if (!_baseValidator.regexHasMatch) return _baseValidator.validate;
    if (!regexHasMatch) return ValidationMessages.get(type);
  }

  @override
  bool get regexHasMatch => true;
}

class ExistingUsernameValidator {
  final ValidationType type = ValidationType.ExistingUsername;

  String? get validate => ValidationMessages.get(type);
}
