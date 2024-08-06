import 'package:ecom_app/core/DI/injectable_config.config.dart';
import 'package:ecom_app/core/services/bloc_listener.dart';
import 'package:ecom_app/core/services/encrypt_decrypt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

@module
abstract class InjectionModule {
  @preResolve
  Future<SharedPreferences> getPrefs() => SharedPreferences.getInstance();

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  EncryptionService encryptionService(FlutterSecureStorage secureStorage) =>
      EncryptionService(secureStorage);
}

@injectableInit
Future<void> configureInjection() async {
  await getIt.init();
  Bloc.observer = AppBlocObserver();
}
