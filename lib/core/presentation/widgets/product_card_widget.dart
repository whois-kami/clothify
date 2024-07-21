import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assets_path_constants.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductEntity productEntity;
  final bool isFavorite;
  const ProductCardWidget({
    super.key,
    required this.productEntity,
    required this.isFavorite,
  });

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late bool _localFavorite;

  @override
  void initState() {
    _localFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/product', extra: widget.productEntity);
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
                      widget.productEntity.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Image.asset(
                      _localFavorite
                          ? TAssetsPath.likeItemIcon
                          : TAssetsPath.noLikeItemIcon,
                      width: 30,
                      height: 30,
                      opacity: const AlwaysStoppedAnimation(.95),
                    ),
                    onPressed: () async {
                      if (!_localFavorite) {
                        context.read<CoreBloc>().add(
                              LikeProductEvent(
                                  productId:
                                      widget.productEntity.id.toString()),
                            );
                      } else {
                        context.read<CoreBloc>().add(
                              DislikeProductEvent(
                                  productId:
                                      widget.productEntity.id.toString()),
                            );
                      }
                      setState(() {
                        _localFavorite = !_localFavorite;
                      });
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2),
                  Text(
                    widget.productEntity.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF191E32),
                        fontSize: 16),
                  ),
                  Text(
                    widget.productEntity.manufacturer,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '\$${widget.productEntity.price.toString()}',
                    style: TextStyle(
                      color: Color(0xFF191E32),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
