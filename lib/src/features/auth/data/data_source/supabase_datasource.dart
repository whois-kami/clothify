import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseAuthDataSource {
  SupabaseClient supabase;
  SupabaseAuthDataSource({required this.supabase});

  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password);

      if (response.user != null) {
        await supabase.from('profiles').insert({
          'UID': supabase.auth.currentUser!.id,
          'name': username,
          'liked_items': [],
          'cart_products': [],
          'order_status': {},
        });
        log('User created successfully and profile inserted.');
      } else {
        log('User creation went wrong...');
      }
    } catch (e) {
      log('An exception occurred: $e');
    }
  }

  Future<void> signIn({required email, required password}) async {
    final response = await supabase.auth
        .signInWithPassword(email: email, password: password);

    if (response.user != null) {
      log('sign in successful');
    } else {
      log('sign in went wrong');
    }
  }

  Stream<AuthState> authStateStream() {
    return supabase.auth.onAuthStateChange;
  }
}
