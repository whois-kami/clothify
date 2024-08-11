import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showSelectCardBottom({
  required BuildContext context,
  required CardEntity? currentSelectedCard,
  required List<CardEntity>? cards,
}) {
  bool value = false;
  CardEntity? selectedCard = currentSelectedCard;
  showMaterialModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFFf5f5f2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(42.0),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => SizedBox(
          height: MediaQuery.of(context).size.height * .45,
          child: Column(
            children: [
              const Text(TAppConstants.paymentMethod1),
              const SizedBox(height: 30),
              if (cards != null)
                Expanded(
                  child: ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      CardEntity card = cards[index];
                      return Column(
                        children: [
                          CardWidget(
                            cardEntity: card,
                            borderColor: TColors.cardWidgetBarierColor,
                            leadingIcon: Checkbox(
                              value: card == selectedCard,
                              onChanged: (bool? value) {
                                if (value != null && value) {
                                  setState(() {
                                    selectedCard = card;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    },
                  ),
                ),
              InkWell(
                onTap: () => context.push('/root/product/cart/payment/newCard'),
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              ElvButtonWidget(
                  textContent: TAppConstants.paymentConfirm,
                  onPressed: () {
                    if (currentSelectedCard == selectedCard) {
                      return;
                    } else {
                      context.read<CartBloc>().add(
                          EditCardEvent(cardNumber: selectedCard!.cardNubmer));
                    }
                  })
            ],
          ),
        ),
      );
    },
  );
}
