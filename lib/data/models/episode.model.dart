import 'package:freeze_show/domain/entities/episode.entity.dart';

class EpisodeModel extends Episode {
  EpisodeModel({
    required String href,
  }) : super(href: href);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      href: json['href'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
