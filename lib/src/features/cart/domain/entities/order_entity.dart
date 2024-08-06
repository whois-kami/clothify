// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';

class OrderEntity extends Equatable {
  final List<CartItemEntity> items;
  final String address;
  final int totalAmount;

  const OrderEntity({
    required this.items,
    required this.address,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [
        items,
        address,
        totalAmount,
      ];
}
