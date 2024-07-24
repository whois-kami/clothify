import 'package:ecom_app/core/presentation/widgets/product_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/confirm_signup_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signin_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../src/features/auth/presentation/widgets/onboarding_screen.dart';
import '../domain/entities/product_entity.dart';
import '../presentation/widgets/root_screen.dart';

class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _rootNavigatorHome = GlobalKey<NavigatorState>();
  // static final _rootNavigatorOrders = GlobalKey<NavigatorState>();
  // static final _rootNavigatorFavorites = GlobalKey<NavigatorState>();
  // static final _rootNavigatorProfile = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/root',
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
      GoRoute(
        path: '/root',
        builder: (context, state) => const RootScreen(),
      )
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) =>
      //       RootScreen(navigationShell: navigationShell),
      //   branches: [
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorHome,
      //       routes: [
      //         GoRoute(
      //           path: '/home',
      //           builder: (context, state) => HomeScreen(
      //             key: ValueKey(state.pageKey),
      //           ),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorOrders,
      //       routes: [
      //         GoRoute(
      //           path: '/orders',
      //           builder: (context, state) => OrderScreen(
      //             key: ValueKey(state.pageKey),
      //           ),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorFavorites,
      //       routes: [
      //         GoRoute(
      //           path: '/favorites',
      //           builder: (context, state) => FavoriteScreen(
      //             key: ValueKey(state.pageKey),
      //           ),
      //         ),
      //       ],
      //     ),
      //     StatefulShellBranch(
      //       navigatorKey: _rootNavigatorProfile,
      //       routes: [
      //         GoRoute(
      //           path: '/profile',
      //           builder: (context, state) =>
      //               SettingsScreen(key: ValueKey(state.pageKey)),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
  );
}
