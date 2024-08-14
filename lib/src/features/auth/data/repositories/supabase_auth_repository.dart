import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data_source/supabase_datasource.dart';

@LazySingleton(as: AuthRepository)
class SupabaseAuthRepositoryImpl implements AuthRepository {
  SupabaseAuthDataSource supabaseds;
  SupabaseAuthRepositoryImpl({required this.supabaseds});

  @override
  Future<void> signIn(String email, String password) async {
    await supabaseds.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp(String email, String password) async {
    await supabaseds.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> addUserInfo(String username) async {
    await supabaseds.addUserInfo(
      username: username,
    );
  }

  @override
  Future<Stream<AuthState>> checkEmailVerif() async {
    return supabaseds.checkEmailVerif();
  }
}
