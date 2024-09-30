import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entity/statistics.dart';
import '../../domain/usecase/get_statistics.dart';

class StatisticsCubit extends Cubit<List<Statistics>> {
  final GetStatistics getStatistics;

  StatisticsCubit(this.getStatistics) : super([]);

  void fetchStatistics() async {
    try {
      final stats = await getStatistics(NoPrams());
      stats.fold((l) => emit([]), (r) => emit(r));
    } catch (e) {
      emit([]);
    }
  }
}
