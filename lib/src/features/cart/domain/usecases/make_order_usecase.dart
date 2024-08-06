import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MakeOrderUsecase {
  final CartRepository cartRepository;
  MakeOrderUsecase({
    required this.cartRepository,
  });

  Future<void> execute({required OrderEntity order}) async {
    await cartRepository.makeOrder(order: order);
  }
}
