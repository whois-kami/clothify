import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseAuthDataSource {
  SupabaseClient supabase;
  SupabaseAuthDataSource({required this.supabase});

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: 'com.supabase.clothify://callback',
      );
    } on AuthException catch (e) {
      throw ('An exception occurred: ${e.message}');
    } catch (e) {
      throw ('An unknown error occurred: $e');
    }
  }

  Future<void> addUserInfo({required String username}) async {
    try {
      await supabase.from('profiles').insert({
        'UID': supabase.auth.currentUser!.id,
        'name': username,
        'liked_items': [],
        'cart_products': [],
        'order_status': {},
      });
    } catch (e) {
      log('An exception occurred: $e');
    }
  }

  Stream<AuthState> checkEmailVerif() {
    return supabase.auth.onAuthStateChange;
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

  Future<void> resendVerificationEmail() async {
    try {
      await supabase.auth.resend(type: OtpType.email);
      log('Verification email sent.');
    } catch (e) {
      log('Failed to send verification email: $e');
    }
  }
}
