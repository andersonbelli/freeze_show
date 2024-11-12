import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  return switch (request.method) {
    HttpMethod.get => _onGet(context, request.uri.queryParameters),
    HttpMethod.post => _onPost(context, request.json()),
    _ => Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      ),
  };
}

Future<Response> _onGet(
  RequestContext context,
  Map<String, String> parameters,
) {
  parameters.forEach((key, value) {
    print('$key: $value');
  });

  // Implement GET logic here
  return Future.value(
    Response(body: 'Hello, World!'),
  );
}

Future<Response> _onPost(
  RequestContext context,
  Future<dynamic> requestBody,
) async {
  try {
    final body = await requestBody;
    print(body);
  } catch (e) {
    print('Failed to parse JSON: $e');
    return Future.value(
      Response(statusCode: HttpStatus.badRequest),
    );
  }

  // Implement POST logic here
  return Future.value(
    Response(),
  );
}
