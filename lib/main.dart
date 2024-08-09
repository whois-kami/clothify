import 'package:ecom_app/app/clothify_app.dart';
import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load();
  await configureInjection();
  await Supabase.initialize(
    url: dotenv.env['API_SUPABASE_URL']!,
    anonKey: dotenv.env['API_SUPABASE_KEY']!,
  );
  runApp(const ClothifyApp());
  FlutterNativeSplash.remove();
}
