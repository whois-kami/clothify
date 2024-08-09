import 'package:ecom_app/core/DI/injectable_config.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/page_index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/assets_path_constants.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/presentation/widgets/eleveated_button_widget.dart';

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
                title: TAppConstants.firstOnBoardImageTitle,
                description: TAppConstants.firstOnBoardImageDesc,
              ),
              IndexPageWidget(
                image: TAssetsPath.onboardingSecond,
                title: TAppConstants.secondOnBoardImageTitle,
                description: TAppConstants.secondOnBoardImageDesc,
              ),
              IndexPageWidget(
                image: TAssetsPath.onboardingThird,
                title: TAppConstants.thirdOnBoardImageTitle,
                description: TAppConstants.thirdOnBoardImageDesc,
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
                  activeDotColor: TColors.activeDotColor,
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
                  textContent: TAppConstants.createAccountButton,
                  onPressed: () => context.go('/signup'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => context.go('/signin'),
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                  child: const Text(TAppConstants.alreadyHaveAccountButton),
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
