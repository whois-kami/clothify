import 'package:ecom_app/core/widgets/eleveated_button_widget.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecom_app/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: Text('Verification'),
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
                          'assets/gifs/reg_succesfull.gif',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Register Success\n',
                              ),
                              TextSpan(
                                text:
                                    'Conglaturation! Your account already created.\nPlease login to get amazing experience.',
                              ),
                            ],
                          ),
                        ),
                        ElvButtonWidget(
                          textContent: 'Go to Homepage',
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
            SizedBox(height: 40),
            Image.asset(
              'assets/gifs/email_sent.gif',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Сonfirmation Email\n',
                  ),
                  TextSpan(
                    text: 'We have sent the email confirmation to\n',
                  ),
                  TextSpan(
                    text: '${widget.email}',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn\'t receive the letter?'),
                TextButton(
                  onPressed: () {},
                  child: Text('Resend'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
