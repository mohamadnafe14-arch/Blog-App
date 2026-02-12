import 'package:blog_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] ?? "",
    email: json['email'] ?? "",
    name: json['name'] ?? "",
  );
  @override
  UserModel copyWith({String? id, String? email, String? name}) => UserModel(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
  );
}
