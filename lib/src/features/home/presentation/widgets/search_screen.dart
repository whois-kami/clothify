import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/core/presentation/widgets/cheaps_widget.dart';
import 'package:ecom_app/core/presentation/widgets/product_card_widget.dart';
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/last_search_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchScreen extends StatefulWidget {
  final bool showTags;
  const SearchScreen({
    super.key,
    required this.showTags,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> selectedCheaps = [];

  @override
  void initState() {
    context.read<HomeBloc>().add(GetLastSearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final products = state.products ?? [];
          final lastSearch = state.lastSearch ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if (widget.showTags) ...[
                    Row(
                      children: [
                        const Text(TAppConstants.lastSearch),
                        const Spacer(),
                        TextButton(
                          child: const Text(TAppConstants.clearAll),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      spacing: 12.0,
                      runSpacing: 13.0,
                      children: lastSearch
                          .map((el) => LastSearchTag(
                                content: el,
                              ))
                          .toList(),
                    ),
                  ] else ...[
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CheapsWidget(
                          selectedCheaps: selectedCheaps,
                          onSelected: (tag) => filteredProducts(tag, products),
                        )),
                    const SizedBox(height: 20),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final currentProduct = products[index];
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 2,
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: ProductCardWidget(
                                productEntity: currentProduct,
                                isFavorite: currentProduct.isFavorite,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ]
                ],
              ),
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void filteredProducts(String tag, List<ProductEntity> products) {
    setState(() {
      if (selectedCheaps.contains(tag)) {
        selectedCheaps.remove(tag);
        context.read<HomeBloc>().add(GetFilteredTagItemsEvent(
            query: selectedCheaps, products: products));
      } else {
        selectedCheaps.add(tag);
        context.read<HomeBloc>().add(GetFilteredTagItemsEvent(
            query: selectedCheaps, products: products));
      }
    });
  }
}
