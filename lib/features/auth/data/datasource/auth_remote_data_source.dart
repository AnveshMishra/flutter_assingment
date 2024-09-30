import 'package:flutter_assignment/core/error/exception.dart';
import 'package:flutter_assignment/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModel> loginWithEmailPassword({
    required String password,
    required String email,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSourceImpl(this.client);
  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var resposne =
          await client.auth.signUp(password: password, email: email, data: {
        'name': name,
      });
      if (resposne.user == null) {
        throw ServerException("User is null");
      }
      return UserModel.fromJson(resposne.user!.toJson());
    } catch (e) {
      throw ServerException("$e");
    }
  }
  
  @override
  Future<UserModel> loginWithEmailPassword(
      {required String password, required String email}) async {
    try {
      var resposne = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (resposne.user == null) {
        throw ServerException("User is null");
      }
      return UserModel.fromJson(resposne.user!.toJson());
    } catch (e) {
      throw ServerException("$e");
    }
  }
}
