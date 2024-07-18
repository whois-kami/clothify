// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseCoreRepository {
  SupabaseClient supabase;
  SupabaseCoreRepository({
    required this.supabase,
  });

  Future<void> likeProduct({required String productId}) async {
    final curUserUid = supabase.auth.currentUser?.id;
    if (curUserUid != null) {
      final response = await supabase
          .from('profiles')
          .select('liked_items')
          .eq('UID', curUserUid)
          .single();

      List<int> likedItems = List<int>.from(response['liked_items']);
      likedItems.add(int.tryParse(productId)!);

      await supabase
          .from('profiles')
          .update({'liked_items': likedItems}).eq('UID', curUserUid);
    } else {
      log('user id not found');
    }
  }

  Future<void> dislikeProduct({required String productId}) async {
    final curUserUid = supabase.auth.currentUser?.id;
    if (curUserUid != null) {
      final response = await supabase
          .from('profiles')
          .select('liked_items')
          .eq('UID', curUserUid)
          .single();

      List<String> likedItems = List<String>.from(response['liked_items']);
      likedItems.remove(productId);

      await supabase
          .from('profiles')
          .update({'liked_items': likedItems}).eq('UID', curUserUid);
    } else {
      log('user id not found');
    }
  }
}
