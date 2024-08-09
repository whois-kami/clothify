import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/widgets/custom_price_view.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/services/delivery_status.dart';
import 'package:ecom_app/src/features/tracking/domain/entities/tracking_item_entity.dart';
import 'package:flutter/material.dart';

class TrackingItemWidget extends StatelessWidget {
  final TrackingItemEntity trackingItemEntity;
  const TrackingItemWidget({super.key, required this.trackingItemEntity});

  @override
  Widget build(BuildContext context) {
    final deliveryStatus = deliveryStatusFromString(trackingItemEntity.status);

    final Color commonColor;
    switch (deliveryStatus) {
      case DeliveryStatus.onProgress:
        commonColor = const Color(0xFF2AABBE);
        break;
      case DeliveryStatus.onTheWay:
        commonColor = const Color(0xFF2ABE88);
        break;
      default:
        commonColor = const Color(0xFF00D161);
        break;
    }
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.45)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(trackingItemEntity.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trackingItemEntity.title,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: TTextConstants.color1,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          TextSpan(
                            text: ' ${trackingItemEntity.color}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          )
                        ]),
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: TTextConstants.qty,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            TextSpan(
                              text: ' ${trackingItemEntity.qty}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      width: 85,
                      height: 28,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: commonColor,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          deliveryStatus.stringValue,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: commonColor,
                                    fontSize: 11,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomPriceView(
                      cost: trackingItemEntity.price.toDouble(),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElvButtonWidget(
                  textContent: TTextConstants.buttonDetail,
                  onPressed: () {},
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.45),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minSize: const Size(160, 48),
                ),
                const Spacer(),
                ElvButtonWidget(
                  textContent: TTextConstants.buttonTracking,
                  onPressed: () {},
                  backgroundColor: const Color(0xFF514EB7),
                  foregroundColor: Colors.white,
                  minSize: const Size(160, 48),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
