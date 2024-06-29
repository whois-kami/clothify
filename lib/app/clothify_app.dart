import 'package:ecom_app/core/routes/app_router.dart';
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
      ],
      child: MaterialApp.router(
        theme: AppTheme.clothifyTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
