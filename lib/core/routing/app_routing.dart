import 'package:ecom_app/core/presentation/widgets/product_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/confirm_signup_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signin_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_screen.dart';
import 'package:ecom_app/src/features/favorites/presentation/widgets/favorite_screen.dart';
import 'package:ecom_app/src/features/order/presentation/widgets/order_screen.dart';
import 'package:ecom_app/src/features/profile/presentation/widgets/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../src/features/auth/presentation/widgets/onboarding_screen.dart';
import '../domain/entities/product_entity.dart';
import '../../src/features/home/presentation/widgets/home_screen.dart';
import '../presentation/widgets/root_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final user = Supabase.instance.client.auth.currentUser;
      final loggingIn =
          state.fullPath == '/signin' || state.fullPath == '/signup';

      if (user == null && !loggingIn) {
        return '/start';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/start',
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
      GoRoute(
        path: '/confirm/:email',
        builder: (context, state) {
          final email = state.pathParameters['email'];
          return ConfirmSignUpScreen(email: email!);
        },
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) {
          final product = state.extra as ProductEntity?;
          if (product == null) {
            return throw ('no product, error');
          }
          return ProductScreen(product: product);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/orders',
                builder: (context, state) => const OrderScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
