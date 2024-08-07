import 'package:flutter/widgets.dart';

class CustomPriceView extends StatelessWidget {
  final double cost;
  final TextStyle? customDollarTextStyle;
  final TextStyle? customPriceTextStyle;

  const CustomPriceView({
    super.key,
    required this.cost,
    this.customDollarTextStyle,
    this.customPriceTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('\$',
                style: customDollarTextStyle ??
                    TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 12,
            )
          ],
        ),
        SizedBox(width: 4),
        Text(
          cost.toString(),
          style: customPriceTextStyle ??
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
