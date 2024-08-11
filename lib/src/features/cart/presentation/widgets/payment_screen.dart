import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/services/location_functions.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/order_entity.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/address_widget.dart';
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
  String? address;

  @override
  void initState() {
    context.read<CartBloc>().add(GetAllCardsEvent());
    super.initState();

    currentPositionFuture = determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Position>(
        future: currentPositionFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            if (address == null) {
              _fetchAddress(snapshot.data!);
            }

            return BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  final cards = state.cards;
                  final CardEntity? selectedCard;
                  if (cards != null && cards.isNotEmpty) {
                    selectedCard =
                        cards.firstWhere((card) => card.selected == true);
                  } else {
                    selectedCard = null;
                  }

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(TAppConstants.address),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text(TAppConstants.edit),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MapWidget(currentPosition: snapshot.data!),
                              const SizedBox(width: 10),
                              AddressWidget(address: address),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text('Products(${widget.cart.cartProducts.length})'),
                          const SizedBox(height: 20),
                          ...widget.cart.cartProducts.map((product) {
                            return Column(
                              children: [
                                PaidProductWidget(product: product),
                                const SizedBox(height: 15),
                              ],
                            );
                          }),
                          const SizedBox(height: 15),
                          const Text(TAppConstants.paymentMethod),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () => showSelectCardBottom(
                              context: context,
                              currentSelectedCard: selectedCard,
                              cards: cards,
                            ),
                            child: CardWidget(
                              cardEntity: selectedCard,
                              borderColor: TColors.greyBorder,
                              leadingIcon: Icon(Icons.chevron_right),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              const Text('${TAppConstants.totalAmount}: '),
                              const SizedBox(height: 15),
                              const Spacer(),
                              Text(widget.cart.totalCartAmount.toString())
                            ],
                          ),
                          const SizedBox(height: 15),
                          ElvButtonWidget(
                            textContent: TAppConstants.checkoutNow,
                            onPressed: _onPressed,
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is CartLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            );
          } else {
            return const Center(
              child: Text(TAppConstants.failedToGetPosition),
            );
          }
        },
      ),
    );
  }

  Future<void> _fetchAddress(Position position) async {
    try {
      final fetchedAddress = await getAddressFromCoordinates(
          position.latitude, position.longitude);
      if (mounted) {
        setState(() {
          address = fetchedAddress;
        });
      }
    } catch (e) {
      setState(() {
        address = 'Error fetching address: $e';
      });
    }
  }

  void _onPressed() {
    if (address != null && widget.cart.cartProducts.isNotEmpty) {
      final order = OrderEntity(
        items: widget.cart.cartProducts,
        address: address!,
        totalAmount: widget.cart.totalCartAmount.toInt(),
      );
      context.read<CartBloc>().add(MakeOrderEvent(order: order));
    }
  }
}
