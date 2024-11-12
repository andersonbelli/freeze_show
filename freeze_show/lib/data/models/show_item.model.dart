import 'package:freeze_show/data/models/schedule.model.dart';
import 'package:freeze_show/data/models/show_image_item.model.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowItemModel extends ShowItem {
  ShowItemModel({
    required int id,
    required String name,
    ShowItemImageModel? image,
    String? summary,
    String? url,
    String? type,
    String? language,
    List<String>? genres,
    ScheduleModel? schedule,
  }) : super(
          id: id,
          name: name,
          image: image,
          summary: summary,
          url: url,
          type: type,
          language: language,
          genres: genres,
          schedule: schedule,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'summary': summary,
      'url': url,
      'type': type,
      'language': language,
      'genres': genres,
      'schedule': schedule,
    };
  }

  factory ShowItemModel.fromJson(Map<String, dynamic> map) {
    return ShowItemModel(
      id: map['id'] as int,
      name: (map['name'] ?? "") as String,
      image: map['image'] != null
          ? ShowItemImageModel.fromJson(
              map['image'] as Map<String, dynamic>,
            )
          : ShowItemImageModel(),
      summary: (map['summary'] ?? "") as String,
      url: (map['url'] ?? "") as String,
      type: (map['type'] ?? "") as String,
      language: (map['language'] ?? "") as String,
      genres: map['genres'] != []
          ? map['genres'].cast<String>() as List<String>
          : null,
      schedule: map['schedule'] != null
          ? ScheduleModel.fromJson(
              map['schedule'] as Map<String, dynamic>,
            )
          : ScheduleModel(),
    );
  }
}
