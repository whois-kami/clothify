import 'package:ecom_app/src/features/home/domain/entities/category_entity.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<List<ProductEntity>> getNewArrivals();
  Future<List<CategoryEntity>> getAllCategories();
  Future<List<ProductEntity>> getAllProductsByCategory({required String categoryName});
  Future<void> addLastSearch({required String query});
  Future<List<String>> getLastSearch();
    Future<List<ProductEntity>> getSearchItems({required String query});

}