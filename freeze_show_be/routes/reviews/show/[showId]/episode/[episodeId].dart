import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String showId, String episodeId) {
  return Response(body: 'user id: $showId, post id: $episodeId');
}
