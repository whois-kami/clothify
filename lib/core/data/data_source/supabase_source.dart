// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
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
          .maybeSingle();

      if (response == null) return;
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

  Future<int> incrementCountProduct({required String productId}) async {
    final prefs = getIt<SharedPreferences>();
    final String? products = prefs.getString('shopping_cart');
    int newCount = 0;

    if (products == null || products == '') {
      Map<String, int> shoppingItems = {
        'item_$productId': 1,
      };
      String encodedMap = jsonEncode(shoppingItems);
      await prefs.setString('shopping_cart', encodedMap);
    } else {
      Map<String, dynamic> shoppingItems = jsonDecode(products);

      String key = 'item_$productId';
      if (shoppingItems.containsKey(key)) {
        shoppingItems[key] = shoppingItems[key] + 1;
        newCount = shoppingItems[key];
      } else {
        shoppingItems[key] = 1;
        newCount = shoppingItems[key];
      }

      String encodedMap = jsonEncode(shoppingItems);

      await prefs.setString('shopping_cart', encodedMap);
    }
    return newCount;
  }

  Future<int> decrementCountProduct({required String productId}) async {
    final prefs = getIt<SharedPreferences>();
    final String? products = prefs.getString('shopping_cart');
    int newCount = 0;

    if (products == null || products == '') {
      Map<String, int> shoppingItems = {
        'item_$productId': 0,
      };
      String encodedMap = jsonEncode(shoppingItems);
      await prefs.setString('shopping_cart', encodedMap);
    } else {
      Map<String, dynamic> shoppingItems = jsonDecode(products);

      String key = 'item_$productId';
      if (shoppingItems.containsKey(key)) {
        shoppingItems[key] = shoppingItems[key] - 1;
        newCount = shoppingItems[key];
      } else {
        shoppingItems[key] = 0;
        newCount = shoppingItems[key];
      }

      String encodedMap = jsonEncode(shoppingItems);

      await prefs.setString('shopping_cart', encodedMap);
    }
    return newCount;
  }

  Future<int?> getCountProduct({required String productId}) async {
    final prefs = getIt<SharedPreferences>();
    final String? products = prefs.getString('shopping_cart');

    if (products == null || products == '') return null;

    Map<String, dynamic> shoppingItems = jsonDecode(products);

    String key = 'item_$productId';
    if (shoppingItems.containsKey(key)) {
      return shoppingItems[key];
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> getAllShopingCart() async {
    final prefs = getIt<SharedPreferences>();
    final String? products = prefs.getString('shopping_cart');

    if (products == null) {
      return {};
    } else {
      Map<String, dynamic> shoppingItems = jsonDecode(products);

      return shoppingItems;
    }
  }
}
