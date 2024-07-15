import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseAuthDataSource {
  SupabaseClient supabase;
  SupabaseAuthDataSource({required this.supabase});

  Future<void> signUp(
      {required username, required email, required password}) async {
    final response =
        await supabase.auth.signUp(email: email, password: password);

    if (response.user != null) {
      log('user created  successfully');
    } else {
      log('user created went wrong');
    }
    // if (response.user != null) {
    //   await supabase.from('profiles').insert({
    //     'name': username,
    //     'email': email,
    //   });
    //   log('user created  successfully');
    // } else {
    //   log('user creating went wrong');
    // }
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
