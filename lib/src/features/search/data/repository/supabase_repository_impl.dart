// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/search/data/data_source/supabase_datasource.dart';
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: SearchRepository)
class SupabaseRepositoryImpl implements SearchRepository {
  final SupabaseSearchDatasource searchDatasource;
  SupabaseRepositoryImpl({
    required this.searchDatasource,
  });

  @override
  Future<void> addLastSearch({required String query}) async {
    await searchDatasource.addLastSearch(query: query);
  }

  @override
  Future<List<String>> getLastSearch() async {
    return await searchDatasource.getLastSearch();
  }

  @override
  Future<List<ProductEntity>> getSearchItems({required String query}) async {
    final productsDTO = await searchDatasource.getSearchItems(query: query);
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
    final productsDTO = await searchDatasource.getFilteredItems(
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
