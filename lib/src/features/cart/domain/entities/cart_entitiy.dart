// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> cartProducts;
  final double totalCartAmount;
 const  CartEntity({
    required this.cartProducts,
    required this.totalCartAmount,
  });

  @override
  List<Object?> get props => [cartProducts];
}
