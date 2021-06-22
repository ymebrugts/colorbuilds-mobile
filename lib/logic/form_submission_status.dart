import 'package:colorbuilds/domain/data/models/SuccessResponse.dart';
import 'package:equatable/equatable.dart';

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

class SubmissionSuccess extends FormSubmissionStatus implements Equatable {
  final SuccessResponse? successResponse;
  SubmissionSuccess({this.successResponse});

  @override
  List<Object?> get props => [successResponse];

  @override
  bool? get stringify => true;
}

class SubmissionFailure extends FormSubmissionStatus {
  final dynamic e;
  const SubmissionFailure(this.e);
}
