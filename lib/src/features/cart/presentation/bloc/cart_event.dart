// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class AddNewCardEvent extends CartEvent {
  final CardEntity cardEntity;
  const AddNewCardEvent({
    required this.cardEntity,
  });

  @override
  List<Object> get props => [cardEntity];
}

class MakeOrderEvent extends CartEvent {
  final OrderEntity order;
  const MakeOrderEvent({
    required this.order,
  });

  @override
  List<Object> get props => [order];
}

class GetAllCardsEvent extends CartEvent {}
