import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseDataSource {
  SupabaseClient supabase;
  SupabaseDataSource({required this.supabase});

  Future<void> signUp(
      {required username, required email, required password}) async {
    await supabase.auth.signUp(email: email, password: password);
    log('user created  successfully');
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
}
