// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:ecom_app/src/features/cart/data/DTO/cart_item_dto.dart';

class CartItemEntity extends Equatable {
  final int id;
  final String title;
  final String color;
  final String imgUrl;
  final int price;
  final int count;
  const CartItemEntity({
    required this.id,
    required this.title,
    required this.color,
    required this.imgUrl,
    required this.price,
    required this.count,
    
  });

  @override
  List<Object?> get props => [
        title,
        color,
        imgUrl,
        price,
      ];

  factory CartItemEntity.fromDTO(CartItemDTO dto) => CartItemEntity(
        id: dto.id ?? 0,
        title: dto.title ?? '',
        color: dto.color ?? '',
        imgUrl: dto.imageUrl ?? '',
        price: dto.price ?? 0,
        count: dto.count ?? 0,
      );

  CartItemEntity copyWith({
    int? id,
    String? title,
    String? color,
    String? imgUrl,
    int? price,
    int? count,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }
}
