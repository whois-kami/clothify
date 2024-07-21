import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseFavoritesDatasource {
  final SupabaseClient supabase;
  SupabaseFavoritesDatasource({
    required this.supabase,
  });

  Future<List<ProductDto>> getFavoritesProducts() async {
    final curUserUid = supabase.auth.currentUser?.id;

    if (curUserUid == null) {
      return [];
    }

    final response = await supabase
        .from('profiles')
        .select('liked_items')
        .eq('UID', curUserUid)
        .single();

    List<int> likedItems = List<int>.from(response['liked_items']);

    if (likedItems.isEmpty) {
      return [];
    }

    final productsResponse = await supabase
        .from('products')
        .select('id, title, manufacturer, tags, color, views, image, price')
        .inFilter('id', likedItems);

    List<ProductDto> favoriteProducts = List<ProductDto>.from(
        productsResponse.map((product) => ProductDto.fromJson(product)));

    return favoriteProducts;
  }
}
