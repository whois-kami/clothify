import 'package:ecom_app/src/features/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/assets_path_constants.dart';

class ProductScreen extends StatelessWidget {
  final ProductEntity product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: ImageIcon(
              AssetImage(TAssetsPath.backShevrone),
            ),
            onPressed: () => context.go('/home'),
          ),
        ),
        title: Text('Detail Product'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_bag),
          ),
        ],
      ),
    );
  }
}
