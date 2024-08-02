import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getAllCartItems();
}
