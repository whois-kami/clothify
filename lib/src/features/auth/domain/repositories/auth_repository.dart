abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String name ,String email, String password);
  // Future<void> resetPassword(String email);
  // Future<void> logOut();
}