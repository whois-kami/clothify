import 'package:ecom_app/core/domain/entities/product_entity.dart';

abstract class SearchRepository {
  Future<void> addLastSearch({required String query});
  Future<List<String>> getLastSearch();
  Future<List<ProductEntity>> getSearchItems({required String query});
  Future<List<ProductEntity>> getFilteredItems({
    required int minPrice,
    required int maxPrice,
    required String selectedColor,
    required String selectedLocation,
    required List<int> productIds,
  });
}
