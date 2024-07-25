import 'package:ecom_app/core/presentation/widgets/skeleton_widget.dart';
import 'package:flutter/material.dart';

class HomeLoadingFillerWidget extends StatefulWidget {
  const HomeLoadingFillerWidget({super.key});

  @override
  State<HomeLoadingFillerWidget> createState() =>
      _HomeLoadingFillerWidgetState();
}

class _HomeLoadingFillerWidgetState extends State<HomeLoadingFillerWidget> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const SkeletonWidget(
              height: 180.0,
              width: double.infinity,
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkeletonWidget(
                  height: 8.0,
                  width: 8.00,
                ),
                SizedBox(width: 4),
                SkeletonWidget(
                  height: 8.0,
                  width: 8.0,
                ),
                SizedBox(width: 4),
                SkeletonWidget(
                  height: 8.0,
                  width: 8.0,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                SkeletonWidget(
                  height: 10,
                  width: 90,
                ),
                Spacer(),
                SkeletonWidget(
                  height: 10,
                  width: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    SkeletonWidget(
                      width: 200,
                      height: 180,
                    ),
                    SizedBox(height: 10),
                    SkeletonWidget(
                      height: 10,
                      width: 100,
                    ),
                    SizedBox(height: 10),
                    SkeletonWidget(
                      height: 10,
                      width: 70,
                    ),
                    SizedBox(height: 10),
                    SkeletonWidget(
                      height: 10,
                      width: 30,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
