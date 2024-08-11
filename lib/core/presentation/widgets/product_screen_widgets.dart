import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/presentation/widgets/count_selecter_widget.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.userWidth,
    required this.userHeight,
    required this.imageUrl,
  });

  final double userWidth;
  final double userHeight;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: userWidth,
      height: userHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 380,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ProductTitleAndCount(product: product),
                  const SizedBox(height: 8),
                  ProductRatingAndStockInfo(
                      isAviable: product.availableQty != 0 ? true : false),
                  const SizedBox(height: 20),
                  ProductColorOptions(),
                  const SizedBox(height: 20),
                  ProductDescription(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProductAmountSelector(
                    productId: product.id,
                    productQty: product.availableQty,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ProductPriceAndCartButton(product: product),
          ],
        ),
      ),
    );
  }
}

class ProductTitleAndCount extends StatelessWidget {
  final ProductEntity product;

  const ProductTitleAndCount({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          product.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        CountSelecterWidget(
          isAviableQty: true,
          aviableQty: product.availableQty,
          productId: product.id,
        )
      ],
    );
  }
}

class ProductRatingAndStockInfo extends StatelessWidget {
  final bool isAviable;
  const ProductRatingAndStockInfo({super.key, required this.isAviable});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          TAssetsPath.starIcon,
          width: 15,
          height: 15,
          opacity: const AlwaysStoppedAnimation(.95),
        ),
        const SizedBox(width: 9),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: TAppConstants.rating,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: SizedBox(width: 10),
            ),
            TextSpan(
              text: TAppConstants.reviewCount,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ]),
        ),
        const Spacer(),
        isAviable
            ? Text(
                TAppConstants.availableInStock,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Text(
                TAppConstants.notavailableInStock,
                style: Theme.of(context).textTheme.bodyMedium,
              )
      ],
    );
  }
}

class ProductColorOptions extends StatelessWidget {
  const ProductColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TAppConstants.color,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            ColorOption(Colors.brown),
            ColorOption(Colors.black),
            ColorOption(Colors.cyan),
            ColorOption(Colors.green),
          ],
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TAppConstants.description,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 5),
        Text(
          TAppConstants.descriptionText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class ProductAmountSelector extends StatelessWidget {
  final int productId;
  final int productQty;
  const ProductAmountSelector({
    super.key,
    required this.productId,
    required this.productQty,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreBloc, CoreState>(
      buildWhen: (previous, current) => current is CoreLoaded,
      builder: (context, state) {
        final count = state is CoreLoaded ? state.productCount : 0;
        return Row(
          children: [
            Text(TAppConstants.chooseAmount,
                style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(),
            CountSelecterWidget(
              aviableQty: productQty,
              isAviableQty: false,
              count: count ?? 0,
              productId: productId,
            ),
          ],
        );
      },
    );
  }
}

class ProductPriceAndCartButton extends StatelessWidget {
  final ProductEntity product;

  const ProductPriceAndCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: TAppConstants.dollarLiter,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextSpan(
                text: '${product.price}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 200,
          child: ElvButtonWidget(
            leadingIcon: Image.asset(
              TAssetsPath.bagIcon,
              width: 40,
              height: 28,
              color: Colors.white,
            ),
            textContent: TAppConstants.addToCart,
            minSize: const Size(150, 60),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
