// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/entities/product_entity.dart';

@injectable
class GetFilteredItemsUsecase {
  final SearchRepository searchRepository;
  GetFilteredItemsUsecase({
    required this.searchRepository,
  });

  Future<List<ProductEntity>> execute({
    required int minPrice,
    required int maxPrice,
    required String selectedColor,
    required String selectedLocation,
    required List<int> productIds,
  }) async {
    return searchRepository.getFilteredItems(
      maxPrice: maxPrice,
      minPrice: minPrice,
      selectedColor: selectedColor,
      selectedLocation: selectedLocation,
      productIds: productIds,
    );
  }
}
