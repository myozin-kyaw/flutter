import 'package:flutter/material.dart';
import 'package:login_ui/pallete.dart';
import 'package:login_ui/widgets/gradient_btn.dart';
import 'package:login_ui/widgets/login_field.dart';
import 'package:login_ui/widgets/social_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign in.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const SocialBtn(
                label: 'Continue with Google',
                iconPath: 'assets/svgs/g_logo.svg',
                horizontal: 100,
              ),
              const SizedBox(height: 15),
              const SocialBtn(
                label: 'Continue with Facebook',
                iconPath: 'assets/svgs/f_logo.svg',
                horizontal: 90,
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              const GradientBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
