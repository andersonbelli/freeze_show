import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final request = context.request;

  return switch (request.method) {
    HttpMethod.get => _getReviewsByShowId(request, id),
    _ => Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      ),
  };
}

Future<Response> _getReviewsByShowId(Request request, String id) async {
  var response = Response(
    statusCode: HttpStatus.notFound,
    body: 'Review not found',
  );

  response = Response.json(
    body: jsonDecode('''
[
  {
    "id": "review_1",
    "showId": "$id",
    "userId": "user_123",
    "episodeId": "episode_456",
    "reviewText": "Amazing episode!",
    "rating": 5,
    "createdAt": "2024-11-10T14:30:00Z"
  },
  {
    "id": "review_2",
    "showId": "$id",
    "userId": "user_456",
    "episodeId": "episode_457",
    "reviewText": "Great season finale.",
    "rating": 4,
    "createdAt": "2024-11-11T09:00:00Z"
  }
]'''),
  );

  return response;
}
