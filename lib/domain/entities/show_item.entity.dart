import 'package:freeze_show/domain/entities/schedule.entity.dart';
import 'package:freeze_show/domain/entities/show_image_item.entity.dart';

class ShowItem {
  int id;
  String name;
  ShowItemImage? image;
  String? summary;
  String? url;
  String? type;
  String? language;
  List<String>? genres;
  Schedule? schedule;

  ShowItem({
    required this.id,
    required this.name,
    this.image,
    this.summary,
    this.url,
    this.type,
    this.language,
    this.genres,
    this.schedule,
  });
}
