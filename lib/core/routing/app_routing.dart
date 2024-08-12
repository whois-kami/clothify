
import 'package:ecom_app/core/presentation/widgets/product_screen.dart';
import 'package:ecom_app/core/services/product_route_data.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/confirm_signup_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signin_screen.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_screen.dart';
import 'package:ecom_app/src/features/cart/domain/entities/cart_entitiy.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/cart_screen.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/full_map_screen.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/new_card_screen.dart';
import 'package:ecom_app/src/features/cart/presentation/widgets/payment_screen.dart';
import 'package:ecom_app/src/features/home/presentation/widgets/search_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/change_password_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/edit_profile_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/help_and_support_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/language_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/leagal_and_polices_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/notifications_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/security_screen.dart';
import 'package:ecom_app/src/features/settings/presentation/widgets/settings_screen.dart';
import 'package:ecom_app/src/features/tracking/presentation/widgets/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../src/features/auth/presentation/widgets/onboarding_screen.dart';
import '../presentation/widgets/root_screen.dart';

class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/root?index=0',

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
        builder: (context, state) {
          final index = int.tryParse(
                  GoRouterState.of(context).uri.queryParameters['index'] ??
                      '') ??
              0;
          return RootScreen(
            initialIndex: index,
          );
        },
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
                builder: (context, state) => const HelpAndSupportScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'tracking',
            builder: (context, state) => const TrackingScreen(),
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) {
              final data = state.extra as ProductRouteData?;
              if (data == null) {
                return throw ('no product, error');
              }
              return ProductScreen(
                product: data.product,
                previousLocation: data.previousLocation,
              );
            },
            routes: [
              GoRoute(
                path: 'cart',
                builder: (context, state) {
                  return const CartScreen();
                },
                routes: [
                  GoRoute(
                    path: 'payment',
                    builder: (context, state) {
                      final cart = state.extra as CartEntity?;
                      if (cart == null) {
                        return throw ('no cart, error');
                      }
                      return PaymentScreen(cart: cart);
                    },
                    routes: [
                      GoRoute(
                        path: 'newCard',
                        builder: (context, state) {
                          return const NewCardScreen();
                        },
                      ),
                      GoRoute(
                        path: 'fullMap',
                        builder: (context, state) {
                          final location = state.extra as Point?;
                          return FullMapScreen(
                            initialLocation: location!,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ],
    // refreshListenable: _pageStream.stream,
  );
}
