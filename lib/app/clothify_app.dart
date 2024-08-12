import 'package:ecom_app/core/presentation/bloc/core_bloc.dart';
import 'package:ecom_app/core/routing/app_routing.dart';
import 'package:ecom_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecom_app/src/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:ecom_app/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecom_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:ecom_app/src/features/tracking/presentation/bloc/tracking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/DI/injectable_config.dart';
import '../core/styles/app_theme.dart';
import '../src/features/auth/presentation/bloc/auth_bloc.dart';

class ClothifyApp extends StatelessWidget {
  const ClothifyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<CoreBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<FavoriteBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<SettingsBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<CartBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<TrackingBloc>(),
        )
      ],
      child: MaterialApp.router(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.lightTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
