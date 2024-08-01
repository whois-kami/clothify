import 'package:ecom_app/core/domain/entities/product_entity.dart';

abstract class FavoriteRepository {
  Future<List<ProductEntity>> getFavoritesProducts();
  Future<List<ProductEntity>> getFilteredItems({
    required int minPrice,
    required int maxPrice,
    required String selectedColor,
    required String selectedLocation,
    required List<int> productIds,
  });
}
