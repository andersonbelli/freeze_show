abstract class Show {
  int get id;
  String get title;
  String get summary;
  List<String> get genres;
  String get ratingAvg;
  String? get imgUrl;
  int get reviewsCount;
  int get favoritesCount;

  /// External API field
  int get apiShowId;
}
