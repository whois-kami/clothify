part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllCartItemsEvent extends CartEvent {}

class UpdateCartItemCountEvent extends CartEvent {
  final String productId;
  final int newCount;

   const UpdateCartItemCountEvent({
    required this.productId,
    required this.newCount,
  });

   @override
  List<Object> get props => [productId, newCount];
}