import 'package:freeze_show/domain/entities/schedule.entity.dart';

class ScheduleModel extends Schedule {
  ScheduleModel({
    String? time,
    List<String>? days,
  }) : super(
          time: time,
          days: days,
        );

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'days': days,
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> map) {
    return ScheduleModel(
      time: map['time'] as String,
      days: map['days'].cast<String>() as List<String>,
    );
  }
}
