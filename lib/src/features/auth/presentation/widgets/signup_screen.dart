import 'dart:math';

import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/input_field_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/widgets/signup_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/eleveated_button_widget.dart';

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
              const Text(
                'Create Account',
                style: TextStyle(
                  color: Color(0xFF181D31),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Start learning with create your account',
                style: TextStyle(
                  color: Color(0xFFBAC0CF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              CstInputFiled(
                pathToIcon: 'assets/images/person_icon.png',
                titleContent: 'Username',
                isPassword: false,
                isPasswordVisible: false,
                textContent: 'Create your username',
                controller: _usernameController,
              ),
              const SizedBox(height: 15),
              CstInputFiled(
                pathToIcon: 'assets/images/email_icon.png',
                titleContent: 'Email or Phone Number',
                isPassword: false,
                isPasswordVisible: false,
                textContent: 'Enter your email or phone number',
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              CstInputFiled(
                pathToIcon: 'assets/images/pass_icon.png',
                titleContent: 'Password',
                isPassword: true,
                isPasswordVisible: isPasswordVisible,
                textContent: 'Create your password',
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                controller: _passwordController,
              ),
              const SizedBox(height: 60),
              ElvButtonWidget(
                textContent: 'Create Account',
                onPressed: _onPressed,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or using other method',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  SignUpButtons(),
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
    context.go('/confirm/${_emailController.text}');
  }
}
