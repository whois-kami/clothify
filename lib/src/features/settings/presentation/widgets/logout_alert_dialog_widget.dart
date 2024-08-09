import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/promo_text_field.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/row_cost_widget.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/row_seporator_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showLogOutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: TColors.whiteBg,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsetsDirectional.zero,
        content: Builder(builder: (context) {
          var height = MediaQuery.sizeOf(context).height;
          var width = MediaQuery.sizeOf(context).width;

          return Container(
            height: height * 0.35,
            width: width * 0.8,
            decoration: BoxDecoration(
              color: TColors.whiteBg,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      color: TColors.iconColor,
                      icon: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text('Are you sure you want to logout?'),
                SizedBox(height: 30),
                ElvButtonWidget(
                  textContent: 'Cancel',
                  onPressed: () => context.pop(),
                  minSize: Size(200, 50),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log Out',
                    style: TextStyle(color: TColors.redIconColor),
                  ),
                )
              ],
            ),
          );
        }),
      );
    },
  );
}
