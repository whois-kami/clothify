import 'package:ecom_app/core/constants/text_constants.dart';
import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/presentation/widgets/count_selecter_widget.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assets_path_constants.dart';

/* TODO 
- Fix issue with repainting all screen
- Separate widgets
*/

class ProductScreen extends StatefulWidget {
  final ProductEntity product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context
        .read<CoreBloc>()
        .add(GetCountProductEvent(productId: widget.product.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userWidth = MediaQuery.sizeOf(context).width;
    final userHeight = MediaQuery.sizeOf(context).height;

    return BlocBuilder<CoreBloc, CoreState>(
      builder: (context, state) {
        if (state is CoreLoaded) {
          final count = state.productCount;
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
                onPressed: () => context.pop(),
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
                    onPressed: () => context.go('/root/cart'),
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
                      image: NetworkImage(widget.product.imageUrl),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                                      widget.product.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Spacer(),
                                    CountSelecterWidget(
                                      count: count ?? 0,
                                      productId: widget.product.id,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image.asset(
                                      TAssetsPath.starIcon,
                                      width: 15,
                                      height: 15,
                                      opacity:
                                          const AlwaysStoppedAnimation(.95),
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
                                          alignment:
                                              PlaceholderAlignment.baseline,
                                          baseline: TextBaseline.alphabetic,
                                          child: SizedBox(width: 10),
                                        ),
                                        TextSpan(
                                          text: TTextConstants.reviewCount,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ]),
                                    ),
                                    const Spacer(),
                                    Text(
                                      TTextConstants.availableInStock,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  TTextConstants.color,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                                    CountSelecterWidget(
                                      count: count ?? 0,
                                      productId: widget.product.id,
                                    ),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    TextSpan(
                                      text: '${widget.product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
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
        } else {
          return SizedBox.shrink();
        }
      },
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
