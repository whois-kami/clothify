import 'package:ecom_app/src/features/auth/presentation/widgets/page_index_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                image: 'assets/images/onboarding_1.jpg',
                title: 'Various Collections Of The Latest Products',
                description:
                    'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
              ),
              IndexPageWidget(
                image: 'assets/images/onboarding_2.jpg',
                title: 'Complete Collection Of Colors And Sizes',
                description:
                    'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
              ),
              IndexPageWidget(
                image: 'assets/images/onboarding_3.jpg',
                title: 'Find The Most Suitable Outfit For You',
                description:
                    'Lorem amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 140,
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
                  textContent: 'Create account',
                  onPressed: () => context.go('/signup'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => context.go('/signin'),
                  child: Text('Already Have an Account'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
