import 'dart:developer';

import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/constants/assets_path_constants.dart';
import 'package:ecom_app/core/constants/colors_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VereficationScreen extends StatefulWidget {
  const VereficationScreen({super.key});

  @override
  State<VereficationScreen> createState() => _VereficationScreenState();
}

class _VereficationScreenState extends State<VereficationScreen> {
  final _pinController = TextEditingController();
  bool isVerify = false;

  @override
  void initState() {
    context.read<AuthBloc>().add(CheckEmailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text(
              TAppConstants.verificationTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15.0),
              child: Container(
                color: TColors.colorGrey.withOpacity(0.15),
                height: 1.5,
              ),
            ),
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Image.asset(
                TAssetsPath.leftArrowIcon,
                width: 25,
                height: 25,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                // Image.asset(TAssetsPath.emailGif),
                SizedBox(height: 15),
                Text(TAppConstants.vereficationCode),
                SizedBox(height: 15),
                Text(TAppConstants.confirmationEmailMessage),
                Text("zhopabobra@aasd.com"),
                SizedBox(height: 30),
                SizedBox(height: 50),
                SizedBox(height: 20),
                BlocListener<AuthBloc, AuthBlocState>(
                  listener: (context, state) {
                    if (state is AuthLoaded) {
                      log('УРА ПОБЕДА');
                    } else if (state is AuthFailure) {
                      log('гг');
                    }
                  },
                  child: Container(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
