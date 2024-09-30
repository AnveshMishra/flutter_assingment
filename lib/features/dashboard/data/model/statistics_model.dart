
import '../../domain/entity/statistics.dart';

class StatisticsModel extends Statistics {
  StatisticsModel({
    required super.title,
    required super.value,
    required super.icon,
  });

  // Factory method to create a model from a JSON object
  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      title: json['title'],
      value: json['value'],
      icon: json['icon'],
    );
  }

}
