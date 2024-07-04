import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final int index;
  const CategoryCardWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Padding(
          padding: index % 2 == 0 ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: index % 2 == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text('New arrivals'),
              Text('208 Products'),
            ],
          ),
        ),
      ),
    );
  }
}
