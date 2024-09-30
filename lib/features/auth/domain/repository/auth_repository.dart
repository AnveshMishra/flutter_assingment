import 'package:flutter_assignment/core/error/faliures.dart';
import 'package:flutter_assignment/features/auth/domain/enitity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Faliure, User>> sinUpWithEmailPassword(
      {required String name, required String password, required String email});
  Future<Either<Faliure, User>> loginWithEmailPassword(
      {required String password, required String email});
}
