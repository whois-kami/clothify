import 'dart:developer';

import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/presentation/widgets/product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  final ProductEntity product;
  final String previousLocation;
  const ProductScreen({
    super.key,
    required this.product,
    required this.previousLocation,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<CoreBloc>()
        .add(GetCountProductEvent(productId: widget.product.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final userWidth = MediaQuery.sizeOf(context).width;
    final userHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          TAppConstants.detailProduct,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => navigate(context, widget.previousLocation),
          icon: Image.asset(
            TAssetsPath.backShevrone,
            width: 30,
            height: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                TAssetsPath.bagIcon,
                width: 30,
                height: 30,
              ),
              onPressed: () => context.push('/product/cart'),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          BackgroundImage(
              userWidth: userWidth,
              userHeight: userHeight,
              imageUrl: widget.product.imageUrl),
          ProductDetailsSection(
            product: widget.product,
          ),
        ],
      ),
    );
  }

  void navigate(BuildContext context, String location) {
    int index = 0;
    switch (widget.previousLocation) {
      case 'home':
        index = 0;
        break;
      case 'favorite':
        index = 2;
        break;
      case 'search':
        index = 4;
        break;
    }
    if (index == 4) {
      context.pop();
    } else {
      context.pushReplacement('/root?index=$index');
      log("asd");
    }
  }
}
