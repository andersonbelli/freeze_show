import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  const Review({
    required this.userId,
    required this.showId,
    required this.episodeId,
    required this.reviewText,
    this.id,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  final String userId;
  final String showId;
  final String episodeId;
  final String reviewText;
  final String? id;
  final int? rating;
  final String? createdAt;
  final String? updatedAt;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
