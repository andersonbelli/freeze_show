import 'package:freeze_show/data/models/show_item_image.model.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowItemModel extends ShowItem {
  ShowItemModel({
    required String name,
    required ShowItemImageModel image,
  }) : super(
          name: name,
          image: image,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory ShowItemModel.fromJson(Map<String, dynamic> map) {
    return ShowItemModel(
      name: map['name'] as String,
      image: ShowItemImageModel.fromJson(map['image'] as Map<String, dynamic>),
    );
  }
}
