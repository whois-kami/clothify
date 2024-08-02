// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCartProductsUsecase {
  final CartRepository cartRepository;
  GetAllCartProductsUsecase({
    required this.cartRepository,
  });

  Future<List<CartItemEntity>> execute() async {
    return await cartRepository.getAllCartItems();
  }
}
