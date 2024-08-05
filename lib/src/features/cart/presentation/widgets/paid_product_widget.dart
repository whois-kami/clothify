import 'package:ecom_app/src/features/cart/domain/entities/cart_item_entitiy.dart';
import 'package:flutter/material.dart';

class PaidProductWidget extends StatelessWidget {
  final CartItemEntity product;
  const PaidProductWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(product.imgUrl), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Color: ${product.color}'),
                  Text('\$${product.price.toDouble()}'),
                ],
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}