import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';

abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormValidating extends FormSubmissionStatus {}

class FormValidationSuccess extends FormSubmissionStatus {}

class FormValidationFailure extends FormSubmissionStatus {}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {
  final SuccessResponse? successResponse;
  SubmissionSuccess({this.successResponse});
}

class SubmissionFailure extends FormSubmissionStatus {
  final dynamic e;
  const SubmissionFailure(this.e);
}
