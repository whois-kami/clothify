import 'package:ecom_app/core/constants/app_constants.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/core/presentation/widgets/input_field_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/assets_path_constants.dart';
import '../../../../../core/presentation/widgets/eleveated_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.07),
              Text(
                TAppConstants.signUpTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              Text(
                TAppConstants.signUpSubtitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 20),
              CstInputFiled(
                pathToIcon: TAssetsPath.inputPersonIcon,
                titleContent: TAppConstants.username,
                isPassword: false,
                isPasswordVisible: false,
                textContent: TAppConstants.createUsername,
                controller: _usernameController,
              ),
              const SizedBox(height: 15),
              CstInputFiled(
                pathToIcon: TAssetsPath.emailIcon,
                titleContent: TAppConstants.signUpEnterEmailOrPhoneNumber,
                isPassword: false,
                isPasswordVisible: false,
                textContent: TAppConstants.signUpEnterEmailOrPhoneNumber,
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              CstInputFiled(
                pathToIcon: TAssetsPath.lockIcon,
                titleContent: TAppConstants.signUpPassword,
                isPassword: true,
                isPasswordVisible: isPasswordVisible,
                textContent: TAppConstants.createPassword,
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                controller: _passwordController,
              ),
              const SizedBox(height: 60),
              ElvButtonWidget(
                textContent: TAppConstants.signUpCreateAccountButton,
                onPressed: _onPressed,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TAppConstants.signUpOtherMethod,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),
                  const SignUpButtons(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    context.read<AuthBloc>().add(SignUpEvent(
          name: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        ));
    // context.go('/confirm/${_emailController.text}');
    context.go('/home');
  }
}
