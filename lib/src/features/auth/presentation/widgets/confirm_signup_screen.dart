import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets_path_constants.dart';

class ConfirmSignUpScreen extends StatefulWidget {
  final String email;

  const ConfirmSignUpScreen({
    super.key,
    required this.email,
  });

  @override
  State<ConfirmSignUpScreen> createState() => _ConfirmSignUpScreenState();
}

class _ConfirmSignUpScreenState extends State<ConfirmSignUpScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(ConfirmEmailEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TAppConstants.verificationTitle),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthLoaded) {
            showBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          TAssetsPath.regSuccesGif,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: TAppConstants.registerSuccessTitle,
                              ),
                              TextSpan(
                                text: TAppConstants.registerSuccessMessage,
                              ),
                            ],
                          ),
                        ),
                        ElvButtonWidget(
                          textContent: TAppConstants.goToHomepageButton,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              TAssetsPath.emailGif,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: TAppConstants.confirmationEmailTitle,
                  ),
                  const TextSpan(
                    text: TAppConstants.confirmationEmailMessage,
                  ),
                  TextSpan(
                    text: widget.email,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(TAppConstants.didNotReceiveLetter),
                TextButton(
                  onPressed: () {},
                  child: const Text(TAppConstants.resendButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
