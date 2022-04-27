import 'package:freeze_show/domain/entities/links.entity.dart';
import 'package:freeze_show/domain/entities/show_image_item.entity.dart';

class ShowSeason {
  int id;
  int number;
  int? episodeOrder;
  String? premiereDate;
  String? endDate;
  ShowItemImage? image;
  String? summary;
  Links? links;

  ShowSeason({
    required this.id,
    required this.number,
    required this.episodeOrder,
    required this.premiereDate,
    required this.endDate,
    required this.image,
    required this.summary,
    required this.links,
  });
}
