import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showOrderSuccessBottomSheet({
  required BuildContext context,
}) {
  showMaterialModalBottomSheet(
    context: context,
    backgroundColor: TColors.modalBottomSheetBg,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(42.0),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .55,
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
              Image.asset(
                TAssetsPath.order,
                width: 230,
                height: 230,
              ),
              Text('Order Successfully'),
              const SizedBox(height: 10),
              Text(
                  'Your order will be packed by the clerk, will\narrive at your house in 3 to 4 days'),
              Spacer(),
              ElvButtonWidget(
                  textContent: 'Order Trackng',
                  onPressed: () => context.pushReplacement('/root?index=1'))
            ],
          ),
        ),
      );
    },
  );
}
