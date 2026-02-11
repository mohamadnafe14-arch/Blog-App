import 'package:blog_app/core/errors/exceptions.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RemoteAuthDataSource {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  });
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final SupabaseClient supabaseClient;

  RemoteAuthDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final res = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (res.user == null) {
      throw ServerException('User not found');
    }
    return UserModel.fromJson(res.user!.toJson());
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final res = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
    if (res.user == null) {
      throw ServerException('User not found');
    }
    return UserModel.fromJson(res.user!.toJson());
  }
}
