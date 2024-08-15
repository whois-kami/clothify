import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/search/domain/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSearchItemsUsecase {
  final SearchRepository searchRepository;
  GetSearchItemsUsecase({
    required this.searchRepository,
  });

  Future<List<ProductEntity>> execute({required String query}) async {
    return searchRepository.getSearchItems(query: query);
  }
}
