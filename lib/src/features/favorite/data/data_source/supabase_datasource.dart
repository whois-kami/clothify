import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseFavoritesDatasource {
  final SupabaseClient supabase;
  final SharedPreferences preferences;
  SupabaseFavoritesDatasource({
    required this.supabase,
    required this.preferences,
  });

  Future<List<ProductDto>> getFavoriteProducts() async {
    final prefs = getIt<SharedPreferences>();

    Set<String> keys = prefs.getKeys();

    List<int> likedItemIds = [];

    for (var key in keys) {
      if (key.startsWith('product_') && key.endsWith('_favorite')) {
        String idStr = key.split('_')[1];
        bool isFavorite = prefs.getBool(key) ?? false;
        if (isFavorite) {
          int? id = int.tryParse(idStr);
          if (id != null) {
            likedItemIds.add(id);
          }
        }
      }
    }

    final productsResponse = await supabase
        .from('products')
        .select('id, title, manufacturer, tags, color, views, image, price, release, availableQty ,location')
        .inFilter('id', likedItemIds);

    List<ProductDto> favoriteProducts = List<ProductDto>.from(
        productsResponse.map((product) => ProductDto.fromJson(product)));

    return favoriteProducts;
  }


  Future<List<ProductDto>> getFilteredItems(
      {required int minPrice,
      required int maxPrice,
      required String selectedColor,
      required String selectedLocation,
      required List<int> productIds}) async {
    final productsResponse = await supabase
        .from('products')
        .select()
        .inFilter('id', productIds)
        .gt('price', minPrice)
        .lt('price', maxPrice)
        .eq('color', selectedColor)
        .eq('location', selectedLocation);


    final productsDTO = productsResponse.map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final ProductDto product = ProductDto.fromJson(productData);
      return product;
    }).toList();

    return productsDTO;
  }


}
