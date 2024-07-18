import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class DislikeUsecase {
  final CoreRepository coreRepository;

  DislikeUsecase({required this.coreRepository});

  Future<void> execute(String productId) async {
    if (productId.isEmpty) {
      throw Exception('Invalid input');
    }
    await coreRepository.dislikeProduct(productId: productId);
  }
}
