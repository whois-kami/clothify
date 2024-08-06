import 'package:ecom_app/core/DI/injectable_config.dart';
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
import 'package:geolocator/geolocator.dart'; // Import this if not already done

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
                  Text('Address'),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('Edit'),
                  ),
                ],
              ),
              FutureBuilder<Position>(
                future: currentPositionFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return Row(
                      children: [
                        MapWidget(currentPosition: snapshot.data!),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'House\n5452 Adobe Falls Rd #15San\nDiego, California(CA), 92120',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(child: Text('Failed to get position.'));
                  }
                },
              ),
              SizedBox(height: 20),
              Text('Products(${widget.cart.cartProducts.length})'),
              SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: widget.cart.cartProducts.map((product) {
                    return Column(
                      children: [
                        PaidProductWidget(product: product),
                        SizedBox(height: 15),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15),
              Text('Payment Method'),
              SizedBox(height: 15),
              InkWell(
                onTap: () => showSelectCardBottom(context: context),
                child: CardWidget(
                  borderColor: Colors.grey,
                  leadingIcon: Icon(Icons.chevron_right),
                ),
              ),
              Row(
                children: [
                  Text('Total amount:'),
                  Spacer(),
                  Text(widget.cart.totalCartAmount.toString())
                ],
              ),
              ElvButtonWidget(
                textContent: 'Checkout Now',
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
