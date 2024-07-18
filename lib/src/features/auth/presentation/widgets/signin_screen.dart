import 'package:ecom_app/core/constants/text_constants.dart';
import 'package:ecom_app/core/presentation/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets_path_constants.dart';
import '../bloc/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthBlocState>(
        listener: (context, state) {
          if (state is AuthLoaded) context.go('/home');
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
                Text(TTextConstants.loginAccountTitle,
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 6),
                Text(TTextConstants.loginAccountSubtitle,
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 20),
                CstInputFiled(
                  pathToIcon: TAssetsPath.emailIcon,
                  titleContent: TTextConstants.emailOrPhoneNumber,
                  isPassword: false,
                  isPasswordVisible: false,
                  textContent: TTextConstants.enterEmailOrPhoneNumber,
                  controller: _emailController,
                ),
                const SizedBox(height: 15),
                CstInputFiled(
                  pathToIcon: TAssetsPath.lockIcon,
                  titleContent: TTextConstants.password,
                  isPassword: true,
                  isPasswordVisible: isPasswordVisible,
                  textContent: TTextConstants.enterPassword,
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  controller: _passwordController,
                ),
                const SizedBox(height: 60),
                ElvButtonWidget(
                  textContent: TTextConstants.signInButton,
                  onPressed: _onPressed,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TTextConstants.otherMethod,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 20),
                    SignUpButtons(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    context.read<AuthBloc>().add(SignInEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ));
  }
}
