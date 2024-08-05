import 'package:ecom_app/app/clothify_app.dart';
import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await Supabase.initialize(
    url: dotenv.env['API_SUPABASE_URL']!,
    anonKey: dotenv.env['API_SUPABASE_KEY']!,
  );

  runApp(const ClothifyApp());
}

