import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_entitiy.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/promo_text_field.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/row_cost_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/row_seporator_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showPurchaseBottom({
  required BuildContext context,
  required TextEditingController promoController,
  required double totalItemsPrice,
  required List<CartItemEntity> itemsEntities,
}) {
  final double totalAmount = calculateTotalAmount(totalItemsPrice);
  final CartEntity cartEntity =
      CartEntity(cartProducts: itemsEntities, totalCartAmount: totalAmount);

  showMaterialModalBottomSheet(
    context: context,
    barrierColor: TColors.modalBottomSheetBarierColor,
    backgroundColor: TColors.modalBottomSheetBg,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(42.0),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .45,
        decoration: BoxDecoration(
          color: TColors.modalBottomSheetBg,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(-4, -3),
              blurRadius: 30,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(4, -3),
              blurRadius: 30,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: TColors.greyBorder.withOpacity(0.35),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              PromoTextFieldWidget(promoController: promoController),
              const SizedBox(height: 20),
              RowCostWidget(
                cost: totalItemsPrice,
                text: TAppConstants.subtotal,
              ),
              const SizedBox(height: 15),
              const RowCostWidget(
                cost: 6.00,
                text: TAppConstants.shipping,
              ),
              const SizedBox(height: 15),
              RowSeporatorWidget(
                color: TColors.greyBorder.withOpacity(0.4),
              ),
              const SizedBox(height: 15),
              RowCostWidget(
                cost: totalAmount,
                text: TAppConstants.totalAmount1,
              ),
              const SizedBox(height: 50),
              ElvButtonWidget(
                textContent: TAppConstants.checkoutButton,
                onPressed: () => context.push('/root/product/cart/payment',
                    extra: cartEntity),
              ),
            ],
          ),
        ),
      );
    },
  );
}

double calculateTotalAmount(double subtotal) {
  const double shippingCost = 6.0;
  return subtotal + shippingCost;
}
