
import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/features/dashboard/domain/entity/statistics.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class StatisticsRepository {
  Future<Either<Faliure, List<Statistics>>> getStatistics();
}
