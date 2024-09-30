import 'package:flutter_assignment/features/auth/domain/enitity/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.id,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
