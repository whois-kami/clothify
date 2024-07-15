import 'package:ecom_app/core/widgets/root_screen.dart';
import 'package:ecom_app/src/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductCardWidget({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/product', extra: productEntity);
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 200,
                    height: 180,
                    child: Image.network(
                      productEntity.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Image.asset(
                      'assets/images/heart_icon.png',
                      width: 30,
                      height: 30,
                      opacity: const AlwaysStoppedAnimation(.95),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  Text(
                    productEntity.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(productEntity.manufacturer),
                  SizedBox(height: 4),
                  Text('${productEntity.price.toString()}\$'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
