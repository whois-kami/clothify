// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../DTO/category_dto.dart';

@lazySingleton
class SupabaseHomeDataSource {
  final SupabaseClient supabase;
  final SharedPreferences preferences;

  SupabaseHomeDataSource({
    required this.supabase,
    required this.preferences,
  });

  Future<List<CategoryDTO>> getAllCategories() async {
    final data =
        await supabase.from('categories').select('title, products_id, image');
    final List<CategoryDTO> categoriesDTO = (data as List<dynamic>)
        .map((el) => CategoryDTO.fromJson(el as Map<String, dynamic>))
        .toList();

    return categoriesDTO;
  }

  Future<List<ProductDto>> getAllProductsByCategory(
      {required String categoryName}) async {
    final categoryData = await supabase
        .from('categories')
        .select('products_id')
        .eq('title', categoryName)
        .single();

    if (categoryData.isEmpty) {
      return [];
    }

    final productsId = (categoryData['products_id'] as String)
        .split(',')
        .map((id) => int.parse(id))
        .toList();

    final data = await supabase
        .from('products')
        .select(
            'id, title, manufacturer, tags, color, views, image, price, release, location, availableQty')
        .inFilter('id', productsId);

    final List<ProductDto> productsDTO = (data as List<dynamic>)
        .map((el) => ProductDto.fromJson(el as Map<String, dynamic>))
        .toList();

    return productsDTO;
  }

  Future<List<ProductDto>> getNewArrivals() async {
    final curUserUid = supabase.auth.currentUser?.id;
    final categoryData = await supabase
        .from('categories')
        .select('products_id')
        .eq('title', 'New Arrivals')
        .single();

    if (categoryData.isEmpty || curUserUid == null) {
      return [];
    }

    final productsId = (categoryData['products_id'] as String)
        .split(',')
        .map((id) => int.parse(id))
        .toList();

    final data = await supabase
        .from('products')
        .select(
            'id, title, manufacturer, tags, color, views, image, price, release, location, availableQty')
        .inFilter('id', productsId);

    final prefs = getIt<SharedPreferences>();
    final List<ProductDto> productsDTO = (data as List<dynamic>).map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final ProductDto product = ProductDto.fromJson(productData);
      final productId = productData['id'];
      product.isFavorite =
          prefs.getBool('product_${productId.toString()}_favorite') ?? false;
      return product;
    }).toList();

    return productsDTO;
  }

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

    final productsDTO = productsResponse.map((el) {
      final Map<String, dynamic> productData = el as Map<String, dynamic>;
      final ProductDto product = ProductDto.fromJson(productData);
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
