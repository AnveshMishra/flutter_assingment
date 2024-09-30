import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/core/usecase/usecase.dart';
import 'package:flutter_assignment/features/auth/domain/enitity/user.dart';
import 'package:flutter_assignment/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository repository;

  UserSignUp(this.repository);
  @override
  Future<Either<Faliure, User>> call(UserSignUpParams params) async {
    return await repository.sinUpWithEmailPassword(
      name: params.name,
      password: params.password,
      email: params.email,
    );
  }
}
