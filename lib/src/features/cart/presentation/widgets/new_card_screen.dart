import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/presentation/widgets/input_field_widget.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({super.key});

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  late final TextEditingController _cardNumberController;
  late final TextEditingController _cardHolderNameController;
  late final TextEditingController _cardExpiredController;
  late final TextEditingController _cartCvvCodeController;

  @override
  void initState() {
    _cardNumberController = TextEditingController();
    _cardHolderNameController = TextEditingController();
    _cardExpiredController = TextEditingController();
    _cartCvvCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _cardExpiredController.dispose();
    _cartCvvCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            CstInputFiled(
              titleContent: 'Card Number',
              isPassword: false,
              isPasswordVisible: false,
              textContent: 'Enter Card Number',
              pathToIcon: TAssetsPath.settigns,
              controller: _cardNumberController,
            ),
            SizedBox(height: 15),
            CstInputFiled(
              titleContent: 'Card Holder Name',
              isPassword: false,
              isPasswordVisible: false,
              textContent: 'Enter Holder Name',
              pathToIcon: TAssetsPath.settigns,
              controller: _cardHolderNameController,
            ),
            SizedBox(height: 15),
            CstInputFiled(
              titleContent: 'Expired',
              isPassword: false,
              isPasswordVisible: false,
              textContent: 'MM/YY',
              pathToIcon: TAssetsPath.settigns,
              controller: _cardExpiredController,
            ),
            SizedBox(height: 15),
            CstInputFiled(
              titleContent: 'CVV Code',
              isPassword: false,
              isPasswordVisible: false,
              textContent: 'CVV',
              pathToIcon: TAssetsPath.settigns,
              controller: _cartCvvCodeController,
            ),
            Spacer(),
            ElvButtonWidget(
              textContent: 'Add Card',
              onPressed: () {
                final card = CardEntity(
                  cardNubmer: _cardNumberController.text,
                  cardHolderName: _cardHolderNameController.text,
                  cardExpired: _cardExpiredController.text,
                  cardCvvCode: _cartCvvCodeController.text,
                );
                context.read<CartBloc>().add(AddNewCardEvent(cardEntity: card));
              },
            )
          ],
        ),
      ),
    );
  }
}
