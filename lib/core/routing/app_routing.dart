import 'package:ecom_app/core/presentation/widgets/product_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/confirm_signup_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signin_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/change_password_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/edit_profile_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/help_and_support_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/language_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/leagal_and_polices_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/notifications_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/security_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/settings_screen.dart';
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
        path: '/root',
        builder: (context, state) => const RootScreen(),
        routes: [
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'editProfile',
                builder: (context, state) => const EditProfileScreen(),
              ),
              GoRoute(
                path: 'changePassword',
                builder: (context, state) => const ChangePasswordScreen(),
              ),
              GoRoute(
                path: 'notifications',
                builder: (context, state) => const NotificationsScreen(),
              ),
              GoRoute(
                path: 'security',
                builder: (context, state) => const SecurutyScreen(),
              ),
              GoRoute(
                path: 'language',
                builder: (context, state) => const LanguageScreen(),
              ),
              GoRoute(
                  path: 'legalAndPolicies',
                  builder: (context, state) => const LeagalAndPolicesScreen()),
              GoRoute(
                path: 'helpAndSupport',
                builder: (context, state) =>  HelpAndSupportScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) {
              final product = state.extra as ProductEntity?;
              if (product == null) {
                return throw ('no product, error');
              }
              return ProductScreen(product: product);
            },
          ),
        ],
      ),
    ],
  );
}
