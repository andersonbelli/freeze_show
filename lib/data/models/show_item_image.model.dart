import 'package:freeze_show/domain/show_item_image.entity.dart';

class ShowItemImageModel extends ShowItemImage {
  ShowItemImageModel({
    required String medium,
    required String original,
  }) : super(
          medium: medium,
          original: original,
        );

  Map<String, dynamic> toJson() {
    return {
      'medium': medium,
      'original': original,
    };
  }

  factory ShowItemImageModel.fromJson(Map<String, dynamic> map) {
    return ShowItemImageModel(
      medium: map['medium'] as String,
      original: map['original'] as String,
    );
  }
}
