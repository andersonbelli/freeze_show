import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:freeze_show_shared/freeze_show_shared.dart';

List<Review> sampleReviews = [
  Review(
    id: '1',
    userId: '10',
    showId: '1',
    episodeId: '3',
    reviewText: '''
Great show, excellent pacing, funny moments. But some scenes were a bit confusing.''',
    rating: 5,
    createdAt: DateTime.now().toString(),
    updatedAt: DateTime.now().toString(),
  ),
  Review(
    id: '2',
    userId: '10',
    showId: '1',
    episodeId: '2',
    reviewText: 'Cool episode, missing some action scenes.',
    rating: 5,
    createdAt: DateTime.now().toString(),
    updatedAt: DateTime.now().toString(),
  ),
];

Future<Response> onRequest(RequestContext context, String id) async {
  final request = context.request;

  return switch (request.method) {
    HttpMethod.get => _getReviewById(request, id),
    HttpMethod.put => _putReview(
        request,
        id,
        request.body,
      ),
    HttpMethod.delete => _onDelete(
        context,
        id,
      ),
    _ => Future.value(
        Response(statusCode: HttpStatus.methodNotAllowed),
      ),
  };
}

Future<Response> _putReview(Request request, String id, body) {
  return Future.value(
    Response(),
  );
}

Future<Response> _onDelete(RequestContext context, String id) {
  if (id.isEmpty) {
    return Future.value(
      Response(statusCode: HttpStatus.badRequest, body: 'Missing ID parameter'),
    );
  }

  // Implement DELETE logic here
  return Future.value(
    Response(),
  );
}

Future<Response> _getReviewById(Request request, String id) async {
  var response = Response(
    statusCode: HttpStatus.notFound,
    body: 'Review not found',
  );

  try {
    sampleReviews.firstWhere((review) {
      if (review.id == id) {
        response = Response.json(
          body: review.toJson(),
        );
      }
      return review.id == id;
    });
  } catch (e) {
    log('Review/[$id] - error: $e');
  }

  return response;
}
