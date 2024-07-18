import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFavoritesDatasource {
  final SupabaseClient supabase;
  SupabaseFavoritesDatasource({
    required this.supabase,
  });

  // Future<List<ProductDto>> getFavoritesProducts() {

  // }
  // Future<void> dislikeProduct();
}