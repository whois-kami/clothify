import 'dart:convert';

import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/src/features/cart/data/DTO/cart_item_DTO.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseCartDatasource {
  final SupabaseClient supabase;
  final SharedPreferences preferences;
  SupabaseCartDatasource({
    required this.supabase,
    required this.preferences,
  });

  Future<List<CartItemDTO>> getAllCartItems() async {
    final prefs = getIt<SharedPreferences>();
    final String? items = prefs.getString('shopping_cart');

    if (items == null) return [];

    Map<String, dynamic> shoppingItems = jsonDecode(items);

    List<int> ids = shoppingItems.keys
        .map((key) => int.tryParse(key.split('_')[1])!)
        .toList();

    final productsData = await supabase
        .from('products')
        .select('id, title, color, image, price')
        .inFilter('id', ids);

    if (productsData.isEmpty) {
      return [];
    }

    List<CartItemDTO> cartItemsDTO = (productsData as List<dynamic>).map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final CartItemDTO product = CartItemDTO.fromJson(productData);

      int productId = productData['id'] as int;
      product.count = shoppingItems['item_$productId'] ?? 0;

      return product;
    }).toList();

    return cartItemsDTO;
  }
}
