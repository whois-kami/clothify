// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSettingsDatasource {
  final SupabaseClient supabase;
 const SupabaseSettingsDatasource({
    required this.supabase,
  });
  
  Future<void> uploadImage({required bytesImage}) async {
    final userId = supabase.auth.currentUser!.id;
    final imagePath = '/$userId/profile';
    await supabase.storage.from('profiles').uploadBinary(imagePath, bytesImage);
    final imageUrl = supabase.storage.from('profiles').getPublicUrl(imagePath); 

  }

}
