import 'package:ecom_app/src/features/auth/presentation/widgets/signin_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_screen.dart';
import 'package:go_router/go_router.dart';

import '../../src/features/auth/presentation/widgets/onboarding_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );
}
