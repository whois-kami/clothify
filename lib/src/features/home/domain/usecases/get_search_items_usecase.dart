import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSearchItemsUsecase {
  final HomeRepository homeRepository;
  GetSearchItemsUsecase({
    required this.homeRepository,
  });

  Future<List<ProductEntity>> execute({required String query}) async {
    return homeRepository.getSearchItems(query: query);
  }
}
