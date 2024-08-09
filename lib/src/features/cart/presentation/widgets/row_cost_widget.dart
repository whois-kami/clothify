import 'package:flutter/material.dart';

class RowCostWidget extends StatelessWidget {
  final String text;
  final double cost;
  const RowCostWidget({
    super.key,
    required this.cost,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        const Spacer(),
        Column(
          children: [
            Text(
              '\$',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(width: 2),
        Text(cost.toStringAsFixed(2)),
      ],
    );
  }
}
