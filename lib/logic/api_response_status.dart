abstract class ApiResponseStatus {
  const ApiResponseStatus();
}

class ApiResponseStatusInitial extends ApiResponseStatus {}

class ApiResponseStatusInProgress extends ApiResponseStatus {}

class ApiResponseStatusSuccess extends ApiResponseStatus {}

class ApiResponseStatusFailure extends ApiResponseStatus {
  final dynamic exception;
  const ApiResponseStatusFailure(this.exception);
}
