import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  FlutterSecureStorage secureStorage;
  late encrypt.Key key;
  final encrypt.IV iv = encrypt.IV.fromLength(16);

  EncryptionService(this.secureStorage);

  Future<void> init() async {
    String? keyString = await secureStorage.read(key: 'encryption_key');
    if (keyString == null) {
      key = encrypt.Key.fromSecureRandom(32);
      await secureStorage.write(key: 'encryption_key', value: key.base64);
    } else {
      key = encrypt.Key.fromBase64(keyString);
    }
  }

  String encryptData(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decryptData(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
