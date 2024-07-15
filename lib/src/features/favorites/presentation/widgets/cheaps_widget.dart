import 'package:flutter/material.dart';

class CheapsWidget extends StatelessWidget {
  const CheapsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cheapsText = const [
      'All',
      'Latest',
      'Most Popular',
      'Cheapest',
      'Dearest',
    ];
    return Row(
      children: [
        Wrap(
          spacing: 8,
          children: cheapsText
              .map((chip) => Chip(
                    label: Text(chip),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
