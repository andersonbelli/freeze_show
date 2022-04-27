import 'package:freeze_show/data/models/links.model.dart';
import 'package:freeze_show/data/models/show_image_item.model.dart';
import 'package:freeze_show/domain/entities/episode_details.entity.dart';

class EpisodeDetailsModel extends EpisodeDetails {
  EpisodeDetailsModel({
    required int id,
    required String name,
    required int season,
    required int number,
    String? type,
    String? airDate,
    String? airtime,
    int? runtime,
    ShowItemImageModel? image,
    String? summary,
    LinksModel? links,
  }) : super(
          id: id,
          name: name,
          season: season,
          number: number,
          type: type,
          airDate: airDate,
          airtime: airtime,
          runtime: runtime,
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
      'type': type,
      'airDate': airDate,
      'airtime': airtime,
      'runtime': runtime,
      'image': image,
      'summary': summary,
      'links': links,
    };
  }

  factory EpisodeDetailsModel.fromJson(Map<String, dynamic> map) {
    return EpisodeDetailsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      season: map['season'] as int,
      number: (map['number'] ?? 0) as int,
      type: (map['type'] ?? "") as String,
      airDate: (map['airDate'] ?? "") as String,
      airtime: (map['airtime'] ?? "") as String,
      runtime: (map['runtime'] ?? 0) as int,
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
