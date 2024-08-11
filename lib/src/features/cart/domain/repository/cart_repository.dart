import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getAllCartItems();
  Future<void> deleteCartItem({required itemId});
  Future<List<CardEntity>> addNewCard({required CardEntity card});
  Future<List<CardEntity>> getAllCards();
  Future<void> makeOrder({required OrderEntity order});
  Future<List<CardEntity>> editCurrentCard({required String cardNumber});
}
