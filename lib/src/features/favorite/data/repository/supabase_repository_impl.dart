// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/favorite/data/data_source/supabase_datasource.dart';
import 'package:ecom_app/src/features/favorite/domain/repository/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoriteRepository)
class SupabaseFavoritesRepositoryImpl extends FavoriteRepository {
  final SupabaseFavoritesDatasource supabaseFavoritesDatasource;
  SupabaseFavoritesRepositoryImpl({
    required this.supabaseFavoritesDatasource,
  });
  @override
  Future<List<ProductEntity>> getFavoritesProducts() async {
    final favoriteProductsDto =
        await supabaseFavoritesDatasource.getFavoriteProducts();
    final favoriteProducts =
        favoriteProductsDto.map((el) => ProductEntity.fromDTO(el)).toList();
    return favoriteProducts;
  }

  @override
  Future<List<ProductEntity>> getFilteredItems(
      {required int minPrice,
      required int maxPrice,
      required String selectedColor,
      required String selectedLocation,
      required List<int> productIds}) async {
    final productsDTO = await supabaseFavoritesDatasource.getFilteredItems(
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
