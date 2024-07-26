// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/domain/entities/user_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseCoreRepository {
  final SupabaseClient supabase;
  final SharedPreferences preferences;
  SupabaseCoreRepository({
    required this.supabase,
    required this.preferences,
  });

  Future<void> likeProduct({required String productId}) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool('product_${productId}_favorite', true);
  }

  Future<void> dislikeProduct({required String productId}) async {
    final prefs = getIt<SharedPreferences>();
    prefs.setBool('product_${productId}_favorite', false);
  }

  Future<void> syncWithDatabase() async {
    final curUserUid = supabase.auth.currentUser?.id;
    if (curUserUid != null) {
      final response = await supabase
          .from('profiles')
          .select('liked_items')
          .eq('UID', curUserUid)
          .single();

      List<int> likedItems = List<int>.from(response['liked_items']);
      final prefs = getIt<SharedPreferences>();

      Set<String> keys = prefs.getKeys();
      bool needsUpdate = false;

      for (var key in keys) {
        if (key.startsWith('product_') && key.endsWith('_favorite')) {
          String id = key.split('_')[1];
          bool keyValue = prefs.getBool(key) ?? false;

          if (!likedItems.contains(int.parse(id)) && keyValue == true) {
            likedItems.add(int.parse(id));
            needsUpdate = true;
          } else if (likedItems.contains(int.parse(id)) && keyValue == false) {
            likedItems.remove(int.parse(id));
            needsUpdate = true;
          }
        }
      }

      for (var key in keys) {
        if (key.startsWith('product_') && key.endsWith('_favorite')) {
          String id = key.split('_')[1];
          if (!likedItems.contains(int.parse(id))) {
            prefs.remove(key);
          }
        }
      }

      if (needsUpdate) {
        await supabase
            .from('profiles')
            .update({'liked_items': likedItems}).eq('UID', curUserUid);
      }
    } else {
      log('sync with db went wrong: user id not found');
    }
  }

  Future<UserEntity> getProfile({String? imageUrl}) async {
    final userId = supabase.auth.currentUser!.id;

    final userNameResponse = await supabase
        .from('profiles')
        .select('name')
        .eq('UID', userId)
        .single();
    final userName = userNameResponse['name'];

    final userEmail = supabase.auth.currentUser?.email;
    if (userEmail == null) {
      throw 'No user email';
    }

    final profileImageUrl = imageUrl ??
        supabase.storage.from('profiles').getPublicUrl('$userId/profile');

    return UserEntity(
      name: userName,
      email: userEmail,
      profileAvatarUrl: profileImageUrl,
    );
  }
}
