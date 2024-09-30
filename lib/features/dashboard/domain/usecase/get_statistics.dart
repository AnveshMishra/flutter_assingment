import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/usecase/usecase.dart';
import '../entity/statistics.dart';
import '../repository/statistics_repository.dart';

class GetStatistics implements UseCase<List<Statistics>, NoPrams> {
  final StatisticsRepository repository;

  GetStatistics(this.repository);

  @override
  Future<Either<Faliure, List<Statistics>>> call(NoPrams params) async {
    return await repository.getStatistics();
  }
}
