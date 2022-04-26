import 'package:freeze_show/domain/entities/episode.entity.dart';
import 'package:freeze_show/domain/entities/links.entity.dart';

class LinksModel extends Links {
  LinksModel({
    Episode? self,
    Episode? previousEpisode,
    Episode? nextEpisode,
  }) : super(
          self: self,
          previousEpisode: previousEpisode,
          nextEpisode: nextEpisode,
        );

  Map<String, dynamic> toJson() {
    return {
      'self': self,
      'previousEpisode': previousEpisode,
      'nextEpisode': nextEpisode,
    };
  }

  factory LinksModel.fromJson(Map<String, dynamic> map) {
    return LinksModel(
      self: map['self'] as Episode,
      previousEpisode: map['previousepisode'] as Episode,
      nextEpisode: map['nextepisode'] as Episode,
    );
  }
}
