import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/services/card_functions.dart';
import 'package:ecom_app/src/features/cart/domain/entities/card_entity.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color borderColor;
  final Widget leadingIcon;
  CardEntity? cardEntity;
  CardWidget({
    super.key,
    required this.borderColor,
    required this.leadingIcon,
    required this.cardEntity,
  });

  @override
  Widget build(BuildContext context) {
    String cardBank;
    String cardNumbers;
    String cardIcon;
    if (cardEntity != null) {
      cardBank = cardTypeDetect(cardEntity!.cardNubmer);
      cardNumbers = editCardData(cardEntity!.cardNubmer);
      cardIcon = detectCardIcon(cardBank);
    } else {
      cardBank = 'Card is not defined';
      cardNumbers = 'Please add payment card';
      cardIcon = '';
    }
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: TColors.cardBg,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: TColors.colorGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: cardIcon != ''
                  ? Center(
                      child: Image.asset(
                        cardIcon,
                        width: 25,
                        height: 25,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardBank),
                SizedBox(height: 5),
                Text(cardNumbers),
              ],
            ),
            const Spacer(),
            leadingIcon,
          ],
        ),
      ),
    );
  }
}
