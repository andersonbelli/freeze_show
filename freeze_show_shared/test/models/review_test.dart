import 'package:freeze_show_shared/src/models/review.dart';
import 'package:test/test.dart';

void main() {
  group('Review Model Test', () {
    test('should create a Review instance', () {
      final review = Review(
        userId: 'user_123',
        showId: 'show_456',
        episodeId: 'episode_789',
        reviewText: 'Great episode!',
        rating: 5,
        createdAt: '2024-11-11T12:34:56Z',
      );

      expect(review.userId, 'user_123');
      expect(review.showId, 'show_456');
      expect(review.episodeId, 'episode_789');
      expect(review.reviewText, 'Great episode!');
      expect(review.rating, 5);
      expect(review.createdAt, '2024-11-11T12:34:56Z');
      expect(review.updatedAt, isNull); // Since updatedAt was not set
    });

    test('should correctly convert Review to JSON', () {
      final review = Review(
        id: '1',
        userId: 'user_123',
        showId: 'show_456',
        episodeId: 'episode_789',
        reviewText: 'Amazing episode!',
        rating: 5,
        createdAt: '2024-11-11T12:34:56Z',
        updatedAt: '2024-11-12T12:34:56Z',
      );

      final json = review.toJson();
      expect(json['id'], '1');
      expect(json['userId'], 'user_123');
      expect(json['showId'], 'show_456');
      expect(json['episodeId'], 'episode_789');
      expect(json['reviewText'], 'Amazing episode!');
      expect(json['rating'], 5);
      expect(json['createdAt'], '2024-11-11T12:34:56Z');
      expect(json['updatedAt'], '2024-11-12T12:34:56Z');
    });

    test('should correctly convert JSON to Review instance', () {
      final json = {
        'id': '1',
        'userId': 'user_123',
        'showId': 'show_456',
        'episodeId': 'episode_789',
        'reviewText': 'Great episode!',
        'rating': 5,
        'createdAt': '2024-11-11T12:34:56Z',
        'updatedAt': '2024-11-12T12:34:56Z',
      };

      final review = Review.fromJson(json);

      expect(review.id, '1');
      expect(review.userId, 'user_123');
      expect(review.showId, 'show_456');
      expect(review.episodeId, 'episode_789');
      expect(review.reviewText, 'Great episode!');
      expect(review.rating, 5);
      expect(review.createdAt, '2024-11-11T12:34:56Z');
      expect(review.updatedAt, '2024-11-12T12:34:56Z');
    });
  });
}
