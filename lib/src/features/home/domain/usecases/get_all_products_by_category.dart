// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';

@injectable
class GetAllProductsByCategoryUseCase {
  final HomeRepository homeRepository;
  GetAllProductsByCategoryUseCase({
    required this.homeRepository,
  });

  Future<List<ProductEntity>> execute({required String categoryName}) async {
    if (categoryName.isEmpty || categoryName == '') {
      throw 'something wrong in categoryName';
    }
    return homeRepository.getAllProductsByCategory(categoryName: categoryName);
  }
}
