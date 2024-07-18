// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/data/DTO/product_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../DTO/category_dto.dart';

@lazySingleton
class SupabaseHomeDataSource {
  final SupabaseClient supabase;
  SupabaseHomeDataSource({
    required this.supabase,
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
        .select('id, title, manufacturer, tags, color, views, image, price')
        .inFilter('id', productsId);

    final List<ProductDto> productsDTO = (data as List<dynamic>)
        .map((el) => ProductDto.fromJson(el as Map<String, dynamic>))
        .toList();

    return productsDTO;
  }

  Future<List<ProductDto>> getNewArrivals() async {
    final categoryData = await supabase
        .from('categories')
        .select('products_id')
        .eq('title', 'New Arrivals')
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
        .select('id, title, manufacturer, tags, color, views, image, price')
        .inFilter('id', productsId);

    final List<ProductDto> productsDTO = (data as List<dynamic>)
        .map((el) => ProductDto.fromJson(el as Map<String, dynamic>))
        .toList();

    return productsDTO;
  }
}
