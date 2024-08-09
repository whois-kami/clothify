// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  List<CartItemEntity> cartItems;
  List<CardEntity>? cards;
  CartLoaded({
    required this.cartItems,
    this.cards,
  });

  @override
  List<Object> get props => [cartItems];
}

class CartFailure extends CartState {
  final String message;
  const CartFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
