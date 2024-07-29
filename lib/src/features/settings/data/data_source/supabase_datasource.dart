// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseSettingsDatasource {
  final SupabaseClient supabase;
  const SupabaseSettingsDatasource({
    required this.supabase,
  });

  Future<void> updateProfile({
    String? name,
    String? email,
    Uint8List? bytesImage,
  }) async {
    if (bytesImage != null) {
      await _uploadImage(bytesImage: bytesImage);
    }

    if (email != null) {
      await _updateEmail(email: email);
    }

    if (name != null) {
      await _updateName(name: name);
    }
  }

  Future<void> _uploadImage({required bytesImage}) async {
    final userId = supabase.auth.currentUser!.id;
    final imagePath = '$userId/profile';
    final storage = supabase.storage.from('profiles');
    final imageUrl = storage.getPublicUrl(imagePath);
    if (imageUrl.isNotEmpty) {
      try {
        await storage.updateBinary(imagePath, bytesImage);
      } catch (e) {
        if (e is StorageException && e.statusCode == '404') {
          await storage.uploadBinary(imagePath, bytesImage);
        }
      }
    } else {
      await storage.uploadBinary(imagePath, bytesImage);
    }
  }

  Future<void> _updateEmail({required email}) async {
    await supabase.auth.updateUser(
      UserAttributes(email: email),
    );
  }

  Future<void> _updateName({required name}) async {
    final userId = supabase.auth.currentUser!.id;
    await supabase.from('profiles').update({'name': name}).eq('UID', userId);
  }

  Future<void> changePassword({required newPassword}) async {
    await supabase.auth.updateUser(
      UserAttributes(password: newPassword),
    );
  }
}
