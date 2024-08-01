import 'package:ecom_app/core/domain/repostitory/core_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllShopingCartUsecase {
  final CoreRepository coreRepository;

  GetAllShopingCartUsecase({required this.coreRepository});

  Future<void> execute() async {
    await coreRepository.getAllShopingCart();
  }
}
