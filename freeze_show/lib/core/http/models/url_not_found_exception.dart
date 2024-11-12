import 'package:freeze_show/core/http/models/base_exception.dart';

class UrlNotFoundException extends BaseException {
  final String? error;

  UrlNotFoundException({this.error})
      : super(error ?? "Url could not be found");
}
