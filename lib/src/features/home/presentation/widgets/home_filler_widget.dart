import 'package:ecom_app/core/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/page_indicator_widget.dart';
import 'package:ecom_app/core/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class HomeFillerWidget extends StatefulWidget {
  final List<ProductEntity> products;
  const HomeFillerWidget({super.key, required this.products});

  @override
  State<HomeFillerWidget> createState() => _HomeFillerWidgetState();
}

class _HomeFillerWidgetState extends State<HomeFillerWidget> {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(viewportFraction: 1.1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: AssetImage(
                          [
                            TAssetsPath.campaignThird,
                            TAssetsPath.campaignSecond,
                            TAssetsPath.campaignFirst,
                          ][index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            PageIndicatorWidget(
              index: _currentPageIndex,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('New arrivals🔥'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                final currentProduct = widget.products[index];
                return ProductCardWidget(
                  productEntity: currentProduct,
                  isFavorite: currentProduct.isFavorite,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
