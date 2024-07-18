import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class LikeUseCase {
  final CoreRepository coreRepository;

  LikeUseCase({required this.coreRepository});

  Future<void> execute(String productId) async {
    if (productId.isEmpty) {
      throw Exception('Invalid input');
    }
    await coreRepository.likeProduct(productId: productId);
  }
}
