import 'package:freeze_show/domain/entities/episode.entity.dart';

class Links {
  final Episode? self;
  final Episode? previousEpisode;
  final Episode? nextEpisode;

  Links({
    this.self,
    this.previousEpisode,
    this.nextEpisode,
  });
}
