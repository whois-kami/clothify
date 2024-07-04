import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 400,
              height: 300 * 0.6,
              child: Image.asset(
                'assets/images/onboarding_2.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                  'productName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('brandName'),
                SizedBox(height: 4),
                Text('price'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
