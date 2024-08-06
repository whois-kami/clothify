import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showSelectCardBottom({
  required BuildContext context,
}) {
  bool value = false;
  showMaterialModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFFf5f5f2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(42.0),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .45,
        child: Column(
          children: [
            Text('Payment Method'),
            SizedBox(height: 30),
            CardWidget(
                borderColor: Colors.transparent,
                leadingIcon: Checkbox(value: value, onChanged: (value) {})),
            SizedBox(height: 30),
            CardWidget(
                borderColor: Colors.transparent,
                leadingIcon: Checkbox(value: value, onChanged: (value) {})),
            InkWell(
              onTap: () => context.push('/root/cart/payment/newCard'),
              child: Container(
                width: 200,
                height: 100,
                color: Colors.red,
              ),
            ),
            ElvButtonWidget(textContent: 'Confirm Payment', onPressed: () {})
          ],
        ),
      );
    },
  );
}
