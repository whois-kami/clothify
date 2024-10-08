import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/add_new_card_usecase.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/delete_cart_item_usecase.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/edit_current_card_usecase.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cards_usecase.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/make_order_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartProductsUsecase getAllCartProductsUsecase;
  final AddNewCardUsecase addNewCardUsecase;
  final MakeOrderUsecase makeOrderUsecase;
  final GetAllCardsUsecase getAllCardsUsecase;
  final EditCurrentCardUsecase editCurrentCardUsecase;
  final DeleteCartItemUsecase deleteCartItemUsecase;
  CartBloc({
    required this.getAllCartProductsUsecase,
    required this.addNewCardUsecase,
    required this.makeOrderUsecase,
    required this.getAllCardsUsecase,
    required this.editCurrentCardUsecase,
    required this.deleteCartItemUsecase,
  }) : super(CartInitial()) {
    on<GetAllCartItemsEvent>(_getAllCartItems);
    on<UpdateCartItemCountEvent>(_updateCartItemCount);
    on<AddNewCardEvent>(_addNewCard);
    on<MakeOrderEvent>(_makeOrder);
    on<GetAllCardsEvent>(_getAllCards);
    on<EditCardEvent>(_editCard);
    on<DeleteCartItemEvent>(_deleteItem);
  }

  Future<void> _deleteItem(
      DeleteCartItemEvent event, Emitter<CartState> emit) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      await deleteCartItemUsecase.execute(event.itemId);
      final updatedItems = currentState.cartItems
          .where((item) => item.id != event.itemId)
          .toList();
      emit(CartLoaded(cartItems: updatedItems));
    }
  }

  Future<void> _editCard(EditCardEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final List<CardEntity> cards =
          await editCurrentCardUsecase.execute(cardNumber: event.cardNumber);
      emit(CartLoaded(cards: cards, cartItems: const []));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  Future<void> _getAllCards(
      GetAllCardsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final List<CardEntity> cards = await getAllCardsUsecase.execute();
      emit(CartLoaded(cards: cards, cartItems: const []));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  Future<void> _makeOrder(MakeOrderEvent event, Emitter<CartState> emit) async {
    try {
      await makeOrderUsecase.execute(order: event.order);
      emit(CartLoaded(cartItems: const []));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  Future<void> _addNewCard(
      AddNewCardEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cards = await addNewCardUsecase.execute(card: event.cardEntity);
      emit(CartLoaded(cartItems: const [], cards: cards));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  Future<void> _getAllCartItems(
      GetAllCartItemsEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await getAllCartProductsUsecase.execute();
      emit(CartLoaded(cartItems: items));
    } catch (e) {
      emit(CartFailure(message: e.toString()));
    }
  }

  void _updateCartItemCount(
      UpdateCartItemCountEvent event, Emitter<CartState> emit) {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      final updatedItems = currentState.cartItems.map((item) {
        if (item.id == int.tryParse(event.productId)) {
          return item.copyWith(count: event.newCount);
        }
        return item;
      }).toList();

      emit(CartLoaded(cartItems: updatedItems));
    }
  }
}
