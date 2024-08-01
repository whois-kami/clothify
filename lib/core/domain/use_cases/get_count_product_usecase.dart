import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCountProductUsecase {
  final CoreRepository coreRepository;

  GetCountProductUsecase({required this.coreRepository});

  Future<int?> execute(String productId) async {
    return await coreRepository.getCountProduct(productId: productId);
  }
}
