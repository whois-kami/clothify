import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  FlutterSecureStorage secureStorage;
  late encrypt.Key key;

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
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return '${iv.base64}:${encrypted.base64}';
  }

  String decryptData(String encryptedData) {
    final parts = encryptedData.split(':');
    if (parts.length != 2) {
      throw ArgumentError('Invalid encrypted data format');
    }

    final iv = encrypt.IV.fromBase64(parts[0]);
    final encryptedText = parts[1];

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }

  String hashData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
