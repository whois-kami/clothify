import 'package:ecom_app/core/domain/entities/product_entity.dart';

abstract class FavoriteRepository {
  Future<List<ProductEntity>> getFavoritesProducts();
  Future<void> dislikeProduct();
}