class UnexpectedException implements Exception {
  final dynamic e;
  UnexpectedException(this.e);
  final String exception = 'Something went wrong!';
}
