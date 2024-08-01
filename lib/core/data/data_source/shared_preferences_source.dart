import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesSource {
  final SharedPreferences preferences;
  SharedPreferencesSource({
    required this.preferences,
  });
}
