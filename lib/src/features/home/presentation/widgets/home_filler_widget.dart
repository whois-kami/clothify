import 'package:ecom_app/src/features/home/domain/entities/product_entity.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/page_indicator_widget.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

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
    _pageViewController = PageController();
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 180,
              child: PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            PageIndicatorWidget(
              index: _currentPageIndex,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text('New arrivals🔥'),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('See All'),
                ),
              ],
            ),
            SizedBox(height: 15),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 20,
              itemBuilder: (context, index) => const ProductCardWidget(),
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
