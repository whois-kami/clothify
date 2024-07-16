import 'package:ecom_app/src/features/auth/presentation/widgets/page_index_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/assets_path_constants.dart';
import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/widgets/eleveated_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              IndexPageWidget(
                image: TAssetsPath.onboardingFirst,
                title: TTextConstants.firstOnBoardImageTitle,
                description: TTextConstants.firstOnBoardImageDesc,
              ),
              IndexPageWidget(
                image: TAssetsPath.onboardingSecond,
                title: TTextConstants.secondOnBoardImageTitle,
                description: TTextConstants.secondOnBoardImageDesc,
              ),
              IndexPageWidget(
                image: TAssetsPath.onboardingThird,
                title: TTextConstants.thirdOnBoardImageTitle,
                description: TTextConstants.thirdOnBoardImageDesc,
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 150,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xFF514DB5),
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElvButtonWidget(
                  textContent: TTextConstants.createAccountButton,
                  onPressed: () => context.go('/signup'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => context.go('/signin'),
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                  child: const Text(TTextConstants.alreadyHaveAccountButton),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
}
