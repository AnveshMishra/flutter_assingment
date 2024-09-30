import 'package:flutter_assignment/core/supabase_utils/supabase_utils.dart';
import 'package:flutter_assignment/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_assignment/features/auth/data/repositry/auth_repository_impl.dart';
import 'package:flutter_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_assignment/features/auth/domain/usecase/user_login.dart';
import 'package:flutter_assignment/features/auth/domain/usecase/user_sign_up.dart';
import 'package:flutter_assignment/features/auth/presentaion/bloc/auth_bloc.dart';
import 'package:flutter_assignment/features/dashboard/data/datasource/fake_data_source.dart';
import 'package:flutter_assignment/features/dashboard/data/repository/statistics_repository_impl.dart';
import 'package:flutter_assignment/features/dashboard/domain/usecase/get_statistics.dart';
import 'package:get_it/get_it.dart';

import '../../features/dashboard/domain/repository/statistics_repository.dart';
import '../../features/dashboard/presentation/cubit/statitics_cubit.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerLazySingleton(() => SupabaseService().client);
  _initAuth();
  _initDashboard();
}

_initAuth() {
  /// data source
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );

  /// repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  ///usecase
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserLogin(serviceLocator()));

  ///bloc
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      signUp: serviceLocator(),
      login: serviceLocator(),
    ),
  );
}

_initDashboard() {
  serviceLocator.registerFactory<StatisticsDataSource>(
    () => FakeStatisticDataSource(),
  );
  serviceLocator.registerFactory<StatisticsRepository>(
    () => StatisticsRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetStatistics(serviceLocator()));

  ///bloc
  serviceLocator.registerLazySingleton(
    () => StatisticsCubit(
      serviceLocator(),
    ),
  );
}
