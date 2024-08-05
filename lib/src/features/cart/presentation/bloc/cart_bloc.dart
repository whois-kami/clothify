import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/usecases/get_all_cart_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetAllCartProductsUsecase getAllCartProductsUsecase;
  CartBloc({
    required this.getAllCartProductsUsecase,
  }) : super(CartInitial()) {
    on<GetAllCartItemsEvent>(_getAllCartItems);
    on<UpdateCartItemCountEvent>(_updateCartItemCount);
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
        if (item.id == int.tryParse(event.productId) ) {
          return item.copyWith(count: event.newCount);
        }
        return item;
      }).toList();

      emit(CartLoaded(cartItems: updatedItems));
    }
  }
}