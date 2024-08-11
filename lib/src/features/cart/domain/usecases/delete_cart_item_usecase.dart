// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCartItemUsecase {
  final CartRepository cartRepository;
  DeleteCartItemUsecase({
    required this.cartRepository,
  });

  Future<void> execute(int itemId) async {
     await cartRepository.deleteCartItem(itemId: itemId);
  }
}
