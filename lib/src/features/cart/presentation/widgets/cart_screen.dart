import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/product_cart_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/puschare_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final TextEditingController _promoController;

  @override
  void initState() {
    context.read<CartBloc>().add(GetAllCartItemsEvent());
    _promoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<CoreBloc, CoreState>(
        listener: (context, coreState) {
          if (coreState is CoreLoaded) {
            context.read<CartBloc>().add(UpdateCartItemCountEvent(
                  productId: coreState.productId ?? '0',
                  newCount: coreState.productCount ?? 0,
                ));
          } else if (coreState is CoreFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(coreState.message)),
            );
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              final items = state.cartItems;
              final totalPrice = totalItemsPrice(items);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final currentItem = items[index];
                          return ProductCartWidget(
                            productId: currentItem.id,
                            title: currentItem.title,
                            color: currentItem.color,
                            count: currentItem.count,
                            price: currentItem.price,
                            imageUrl: currentItem.imgUrl,
                          );
                        },
                      ),
                    ),
                    ElvButtonWidget(
                      textContent: TTextConstants.goToCheckout,
                      onPressed: () => showPurchaseBottom(
                        context: context,
                        promoController: _promoController,
                        totalItemsPrice: totalPrice.toDouble(),
                        itemsEntities: items,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  int totalItemsPrice(List<CartItemEntity> items) {
    return items.fold<int>(
        0, (totalPrice, el) => totalPrice + (el.price * el.count));
  }
}
