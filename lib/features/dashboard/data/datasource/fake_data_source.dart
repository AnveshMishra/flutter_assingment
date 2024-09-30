import 'package:flutter_assignment/features/dashboard/data/model/statistics_model.dart';

abstract interface class StatisticsDataSource {
  Future<List<StatisticsModel>> getStats();
}

class FakeStatisticDataSource extends StatisticsDataSource {
  @override
  Future<List<StatisticsModel>> getStats() async{
    return [
      StatisticsModel(title: "Users", value: "1.2K", icon: "person"),
      StatisticsModel(title: "Revenue", value: "\$12K", icon: "monetization_on"),
      StatisticsModel(title: "Orders", value: "450", icon: "shopping_cart"),
      StatisticsModel(title: "Reviews", value: "4.5/5", icon: "star"),
    ];
  }
}
