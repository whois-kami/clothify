// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/supabase_datasource.dart';

@LazySingleton(as: HomeRepository)
class SupabaseRepositoryImpl implements HomeRepository {
  final SupabaseHomeDataSource dataSource;
  SupabaseRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    final categoriesDTO = await dataSource.getAllCategories();
    final categories =
        (categoriesDTO).map((el) => CategoryEntity.fromDTO(el)).toList();
    return categories;
  }

  @override
  Future<List<ProductEntity>> getAllProductsByCategory(
      {required String categoryName}) async {
    final productsDTO =
        await dataSource.getAllProductsByCategory(categoryName: categoryName);
    final products =
        (productsDTO).map((el) => ProductEntity.fromDTO(el)).toList();
    return products;
  }

  @override
  Future<List<ProductEntity>> getNewArrivals() async {
    final productsDTO = await dataSource.getNewArrivals();
    final products =
        (productsDTO).map((el) => ProductEntity.fromDTO(el)).toList();
    return products;
  }

  @override
  Future<void> addLastSearch({required String query}) async {
    await dataSource.addLastSearch(query: query);
  }

  @override
  Future<List<String>> getLastSearch() async {
    return await dataSource.getLastSearch();
  }

  @override
  Future<List<ProductEntity>> getSearchItems({required String query}) async {
    final productsDTO = await dataSource.getSearchItems(query: query);
    final products =
        (productsDTO).map((el) => ProductEntity.fromDTO(el)).toList();
    return products;
  }

  @override
  Future<List<ProductEntity>> getFilteredItems(
      {required int minPrice,
      required int maxPrice,
      required String selectedColor,
      required String selectedLocation,
      required List<int> productIds}) async {
    final productsDTO = await dataSource.getFilteredItems(
      maxPrice: maxPrice,
      minPrice: minPrice,
      selectedColor: selectedColor,
      selectedLocation: selectedLocation,
      productIds: productIds,
    );
    final products =
        (productsDTO).map((el) => ProductEntity.fromDTO(el)).toList();
    return products;
  }
}
