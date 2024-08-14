
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> addUserInfo(String username);
  Future<Stream<AuthState>> checkEmailVerif();
 
}
