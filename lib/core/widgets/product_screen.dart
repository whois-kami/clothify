import 'package:ecom_app/core/constants/text_constants.dart';
import 'package:ecom_app/core/widgets/count_selecter_widget.dart';
import 'package:ecom_app/core/widgets/eleveated_button_widget.dart';
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
    final userWidth = MediaQuery.sizeOf(context).width;
    final userHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(
          TTextConstants.detailProduct,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/home'),
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: userWidth,
            height: userHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 380,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          Row(
                            children: [
                              Text(
                                product.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              const CountSelecterWidget(),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
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
                                    text: TTextConstants.rating,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  const WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: SizedBox(width: 10),
                                  ),
                                  TextSpan(
                                    text: TTextConstants.reviewCount,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ]),
                              ),
                              const Spacer(),
                              Text(
                                TTextConstants.availableInStock,
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            TTextConstants.color,
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
                          const SizedBox(height: 20),
                          Text(
                            TTextConstants.description,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            TTextConstants.descriptionText,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(TTextConstants.chooseAmount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const Spacer(),
                              const CountSelecterWidget(),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: TTextConstants.dollarLiter,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              TextSpan(
                                text: '${product.price}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
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
                              height: 30,
                              color: Colors.white,
                            ),
                            textContent: TTextConstants.addToCart,
                            minSize: const Size(150, 60),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
