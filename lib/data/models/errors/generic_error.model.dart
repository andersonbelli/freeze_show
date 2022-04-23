import 'package:freeze_show/core/http/models/base_exception.dart';

class GenericErrorModel extends BaseException {
  final String? exception;

  GenericErrorModel({this.exception})
      : super(exception ?? 'Something went wrong, please try again');
}
