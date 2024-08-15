import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseSearchDatasource {
  final SupabaseClient supabase;
  final SharedPreferences preferences;

  SupabaseSearchDatasource({
    required this.supabase,
    required this.preferences,
  });

  Future<void> addLastSearch({required String query}) async {
    final prefs = getIt<SharedPreferences>();
    final List<String>? items = prefs.getStringList('lastSearchItems');
    if (items != null) {
      if (items.length != 4) {
        items.add(query);
        await prefs.setStringList('lastSearchItems', items);
      } else {
        items.removeAt(0);
        items.add(query);
        await prefs.setStringList('lastSearchItems', items);
      }
    } else {
      await prefs.setStringList('lastSearchItems', <String>[query]);
    }
  }

  Future<List<String>> getLastSearch() async {
    final prefs = getIt<SharedPreferences>();
    final List<String>? items = prefs.getStringList('lastSearchItems');
    if (items != null) {
      return items;
    } else {
      return [];
    }
  }

  List<int> getLikedItems() {
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
    return likedItemIds;
  }

  Future<List<ProductDto>> getSearchItems({required String query}) async {
    String formattedQuery =
        query.split(' ').map((word) => '%$word%').join('% & %') + '%';

    final prefs = getIt<SharedPreferences>();

    Set<String> keys = prefs.getKeys();

    final productsResponse =
        await supabase.from('products').select().ilike('title', formattedQuery);

    if (productsResponse is! List<dynamic>) {
      throw Exception(
          'Unexpected response format: ${productsResponse.runtimeType}');
    }

    final likedItems = getLikedItems();

    final productsDTO = productsResponse.map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final ProductDto product = ProductDto.fromJson(productData)
        ..isFavorite = likedItems.contains(el['id']);
      return product;
    }).toList();

    return productsDTO;
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
