import 'package:freeze_show/data/models/links.model.dart';
import 'package:freeze_show/data/models/show_image_item.model.dart';
import 'package:freeze_show/data/models/show_item.model.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';

class ShowEpisodeItemModel extends ShowEpisodeItem {
  ShowEpisodeItemModel({
    required ShowItemModel show,
    required String name,
    int? id,
    int? season,
    int? number,
    String? url,
    ShowItemImageModel? image,
    String? summary,
    LinksModel? links,
  }) : super(
          id: id,
          name: name,
          season: season,
          number: number,
          show: show,
          url: url,
          image: image,
          summary: summary,
          links: links,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'season': season,
      'number': number,
      'show': show,
      'url': url,
      'image': image,
      'summary': summary,
      'links': links,
    };
  }

  factory ShowEpisodeItemModel.fromJson(Map<String, dynamic> map) {
    return ShowEpisodeItemModel(
      show: ShowItemModel.fromJson(map['show'] as Map<String, dynamic>),
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? "") as String,
      season: (map['season'] ?? 0) as int,
      number: (map['number'] ?? 0) as int,
      url: (map['url'] ?? "") as String,
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
}
