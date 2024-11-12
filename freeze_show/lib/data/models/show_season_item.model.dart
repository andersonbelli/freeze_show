import 'package:freeze_show/data/models/links.model.dart';
import 'package:freeze_show/data/models/show_image_item.model.dart';
import 'package:freeze_show/domain/entities/show_season_item.entity.dart';

class ShowSeasonModel extends ShowSeason {
  ShowSeasonModel({
    required int id,
    required int number,
    int? episodeOrder,
    String? premiereDate,
    String? endDate,
    ShowItemImageModel? image,
    String? summary,
    LinksModel? links,
  }) : super(
          id: id,
          number: number,
          episodeOrder: episodeOrder,
          premiereDate: premiereDate,
          endDate: endDate,
          image: image,
          summary: summary,
          links: links,
        );

  factory ShowSeasonModel.fromJson(Map<String, dynamic> map) {
    return ShowSeasonModel(
      id: map['id'] as int,
      number: map['number'] as int,
      episodeOrder: map['episodeOrder'] as int,
      premiereDate: map['premiereDate'] as String,
      endDate: map['endDate'] as String,
      image: map['image'] != null
          ? ShowItemImageModel.fromJson(
              map['image'] as Map<String, dynamic>,
            )
          : ShowItemImageModel(),
      summary: (map['summary'] ?? "") as String,
      links: map['links'] != null
          ? LinksModel.fromJson(map['links'] as Map<String, dynamic>)
          : LinksModel(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'summary': summary,
      'number': number,
      'episodeOrder': episodeOrder,
      'premiereDate': premiereDate,
      'endDate': endDate,
      'image': image,
      'links': links,
    };
  }
}
