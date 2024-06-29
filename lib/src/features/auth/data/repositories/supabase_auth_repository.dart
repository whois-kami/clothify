import 'package:ecom_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/supabase_datasource.dart';

@LazySingleton(as: AuthRepository)
class SupabaseAuthRepositoryImpl implements AuthRepository {
  SupabaseDataSource supabaseds;
  SupabaseAuthRepositoryImpl({required this.supabaseds});

  @override
  Future<void> signIn(String email, String password) async {
    await supabaseds.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp(String username, String email, String password) async {
    await supabaseds.signUp(
      username: username,
      email: email,
      password: password,
    );
  }
}
