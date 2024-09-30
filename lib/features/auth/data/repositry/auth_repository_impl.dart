import 'package:flutter_assignment/core/error/exception.dart';
import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/enitity/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either<Faliure, User>> loginWithEmailPassword({
    required String password,
    required String email,
  }) async {
    try {
      final userId = await dataSource.loginWithEmailPassword(
          email: email, password: password);
      return right(userId);
    } on ServerException catch (e) {
      return left(
        Faliure(e.message),
      );
    } catch (e) {
      return left(
        Faliure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Faliure, User>> sinUpWithEmailPassword(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final userId = await dataSource.signUpWithEmailPassword(
          email: email, password: password, name: name);
      return right(userId);
    } on ServerException catch (e) {
      return left(
        Faliure(e.message),
      );
    } catch (e) {
      return left(
        Faliure(e.toString()),
      );
    }
  }
}
