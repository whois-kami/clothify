import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/services/get_current_location.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/card_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/map_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/paid_product_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/select_card_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class PaymentScreen extends StatefulWidget {
  final CartEntity cart;
  const PaymentScreen({
    super.key,
    required this.cart,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Future<Position> currentPositionFuture;

  @override
  void initState() {
    super.initState();
    currentPositionFuture = determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(TTextConstants.address),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(TTextConstants.edit),
                  ),
                ],
              ),
              FutureBuilder<Position>(
                future: currentPositionFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Row(
                      children: [
                        MapWidget(currentPosition: snapshot.data!),
                        const SizedBox(width: 10),
                        const Column(
                          children: [
                            // TODO сделать парсинг адреса
                            Text(
                              'House\n5452 Adobe Falls Rd #15San\nDiego, California(CA), 92120',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    );
                  } else {
                    return const Center(
                        child: Text(TTextConstants.failedToGetPosition));
                  }
                },
              ),
              const SizedBox(height: 20),
              Text('Products(${widget.cart.cartProducts.length})'),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.cart.cartProducts.map((product) {
                    return Column(
                      children: [
                        PaidProductWidget(product: product),
                      const  SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ),
              ),
             const SizedBox(height: 15),
           const   Text(TTextConstants.paymentMethod),
           const   SizedBox(height: 15),
              InkWell(
                onTap: () => showSelectCardBottom(context: context),
                child: const CardWidget(
                  borderColor: TColors.greyBorder,
                  leadingIcon: Icon(Icons.chevron_right),
                ),
              ),
              Row(
                children: [
                const  Text('${TTextConstants.totalAmount}: '),
               const   Spacer(),
                  Text(widget.cart.totalCartAmount.toString())
                ],
              ),
              ElvButtonWidget(
                textContent: TTextConstants.checkoutNow,
                onPressed: _onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    final order = OrderEntity(
        items: widget.cart.cartProducts,
        address: 'Novaya Zhizn',
        totalAmount: widget.cart.totalCartAmount.toInt());
    context.read<CartBloc>().add(MakeOrderEvent(order: order));
  }
}
