import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/features/auth/domain/enitity/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository repository;

  UserLogin(this.repository);

  @override
  Future<Either<Faliure, User>> call(UserLoginParams params) async{
    return  await repository.loginWithEmailPassword(
        email: params.email, password: params.password);
  }
}
