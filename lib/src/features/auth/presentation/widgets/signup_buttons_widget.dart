import 'package:flutter/material.dart';

import '../../../../../core/widgets/eleveated_button_widget.dart';

class SignUpButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElvButtonWidget(
          textContent: "Sign Up with Google",
          onPressed: () {},
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF181D31),
          leadingIcon: Image.asset(
            'assets/images/signup_google.png',
            height: 24,
          ),
          side: const BorderSide(
            color: Color(0xFFEAEAEA),
          ),
        ),
        const SizedBox(height: 20),
        ElvButtonWidget(
          textContent: "Sign Up with Facebook",
          onPressed: () {},
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF181D31),
          leadingIcon: Image.asset(
            'assets/images/signup_facebook.png',
            height: 24,
          ),
          side: const BorderSide(
            color: Color(0xFFEAEAEA),
          ),
        ),
      ],
    );
  }
}
