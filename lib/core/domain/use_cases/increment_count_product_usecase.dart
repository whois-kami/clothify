import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncrementCountProductUsecase {
  final CoreRepository coreRepository;

  IncrementCountProductUsecase({required this.coreRepository});

  Future<int> execute(String productId) async {
    if (productId.isEmpty) {
      throw Exception('Invalid input');
    }
    return await coreRepository.incrementCountProduct(productId: productId);
  }
}
