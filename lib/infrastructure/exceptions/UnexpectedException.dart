import 'package:colorbuilds/infrastructure/exceptions/contracts/AbstractPrintableException.dart';

class UnexpectedException extends AbstractPrintableException {
  UnexpectedException(dynamic exception) : super(exception);
}
