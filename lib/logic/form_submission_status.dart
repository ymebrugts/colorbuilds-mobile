import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';

abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {
  final SuccessResponse? successResponse;
  SubmissionSuccess({this.successResponse});
}

class SubmissionFailed extends FormSubmissionStatus {
  final dynamic e;
  const SubmissionFailed(this.e);
}
