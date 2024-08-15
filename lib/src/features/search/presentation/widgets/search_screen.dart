// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecom_app/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:ecom_app/src/features/search/presentation/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/widgets/cheaps_widget.dart';
import 'package:ecom_app/core/presentation/widgets/product_card_widget.dart';
import 'package:ecom_app/src/features/search/presentation/widgets/last_search_tag.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> selectedCheaps = [];
  bool showTags = true;

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(GetLastSearchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchAppBar(
            onSearchStarted: (_) {
              setState(() {
                showTags = false;
              });
            },
          ),
          showTags
              ? BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is LastSearchLoaded) {
                      final search = state.lastSearch;
                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              const SizedBox(height: 20),
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
                                children: search
                                    .map((el) => LastSearchTag(
                                          content: el,
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CheapsWidget(
                    selectedCheaps: selectedCheaps,
                    onSelected: (tag) {},
                  ),
                ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                final products = state.products;
                return SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  sliver: AnimationLimiter(
                    child: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final currentProduct = products[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: ProductCardWidget(
                                  productEntity: currentProduct,
                                  location: 'favorite',
                                  isFavorite: true,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: products.length,
                      ),
                    ),
                  ),
                );
              } else if (state is SearchLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox.shrink(),
                );
              }
            },
          )
        ],
      ),
    );
  }

  // void filteredProducts(String tag, List<ProductEntity> products) {
  //   setState(() {
  //     if (selectedCheaps.contains(tag)) {
  //       selectedCheaps.remove(tag);
  //     } else {
  //       selectedCheaps.add(tag);
  //     }
  //     context.read<SearchBloc>().add(
  //           GetFilteredTagItemsEvent(query: selectedCheaps, products: products),
  //         );
  //   });
  // }
}
