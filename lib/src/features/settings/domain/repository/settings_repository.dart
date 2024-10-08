import 'dart:typed_data';

abstract class SettingsRepository {
  Future<void> updateProfile({
    Uint8List? bytesImage,
    String? name,
    String? email,
  });
  Future<void> changePassword({required newPassword});
  Future<void> logOut();
}
