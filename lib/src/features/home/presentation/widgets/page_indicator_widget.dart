import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int index;
  const PageIndicatorWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: index == 0 ? const Color(0xFF504DB4) : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: index == 1 ? const Color(0xFF504DB4) : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              color: index == 2 ? const Color(0xFF504DB4) : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
