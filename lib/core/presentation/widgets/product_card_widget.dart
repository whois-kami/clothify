import 'package:cached_network_image/cached_network_image.dart';
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
    double screenWidth = MediaQuery.sizeOf(context).width;
    double cardWidth = screenWidth * 0.45;
    double imageHeight = cardWidth * 1.05;

    return InkWell(
      onTap: () {
        context.go('/root/product', extra: widget.productEntity);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
                CachedNetworkImage(
                  imageUrl: widget.productEntity.imageUrl,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: cardWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                    width: cardWidth,
                    height: imageHeight,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                      child: Column(
                    children: [
                      Icon(Icons.error),
                      Text('Не удалось загрузить картинку...')
                    ],
                  )),
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
