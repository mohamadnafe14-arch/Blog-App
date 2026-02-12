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
  Session? get currentSession;
  Future<UserModel?> getCurrentUser();
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final SupabaseClient supabaseClient;

  RemoteAuthDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;
      if (user == null) {
        throw ServerException('Invalid email or password');
      }

      return UserModel.fromJson(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final res = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final user = res.user;
      if (user == null) {
        throw ServerException('Sign up failed');
      }

      return UserModel.fromJson(user.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) return null;

      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (userData == null) return null;

      return UserModel.fromJson(userData).copyWith(email: user.email);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
