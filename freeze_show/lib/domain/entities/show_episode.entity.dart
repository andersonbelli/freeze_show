import 'package:freeze_show/domain/entities/links.entity.dart';
import 'package:freeze_show/domain/entities/show_image_item.entity.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowEpisodeItem {
  final ShowItem show;
  final String name;
  final int? id;
  final int? season;
  final int? number;
  final String? url;
  final ShowItemImage? image;
  final String? summary;
  final Links? links;

  ShowEpisodeItem({
    required this.show,
    required this.name,
    this.id,
    this.season,
    this.number,
    this.url,
    this.image,
    this.summary,
    this.links,
  });
}
