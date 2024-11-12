abstract class Episode {
  int get id;
  int get showId;
  String get title;
  String get summary;
  String get seasonNumber;
  String get episodeNumber;
  String get ratingAvg;
  int get reviewsCount;

  /// External API field
  int get apiEpisodeId;
}
