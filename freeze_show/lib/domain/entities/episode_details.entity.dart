import 'package:freeze_show/domain/entities/links.entity.dart';
import 'package:freeze_show/domain/entities/show_image_item.entity.dart';

class EpisodeDetails {
  int id;
  String name;
  int season;
  int number;
  String? type;
  String? airDate;
  String? airtime;
  int? runtime;
  ShowItemImage? image;
  String? summary;
  Links? links;

  EpisodeDetails({
    required this.id,
    required this.name,
    required this.season,
    required this.number,
    this.type,
    this.airDate,
    this.airtime,
    this.runtime,
    this.image,
    this.summary,
    this.links,
  });
}
