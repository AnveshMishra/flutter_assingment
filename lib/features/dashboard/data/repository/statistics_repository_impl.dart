import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/features/dashboard/domain/entity/statistics.dart';
import 'package:flutter_assignment/features/dashboard/domain/repository/statistics_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../datasource/fake_data_source.dart';

class StatisticsRepositoryImpl implements StatisticsRepository {
  StatisticsDataSource dataSource;
  StatisticsRepositoryImpl(this.dataSource);
  @override
  Future<Either<Faliure, List<Statistics>>> getStatistics() async {
    var fakedata = await dataSource.getStats();
    return right(fakedata);
  }
}
