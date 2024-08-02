import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/product_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(GetAllCartItemsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.pop(), icon: Icon(Icons.back_hand))
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final items = state.cartItems;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
