import 'package:ecom_app/core/DI/injectable_config.config.dart';
import 'package:ecom_app/core/services/bloc_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
}

@injectableInit
Future<void> configureInjection() async {
  await getIt.init();
  Bloc.observer = AppBlocObserver();
}
