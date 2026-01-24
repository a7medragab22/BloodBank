import 'package:blodbank/core/ReusableCompounds/widgets/logo.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/auth/presentation/screens/login_screen.dart';
import 'package:blodbank/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});
  static String id = 'InitialView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Logo()),
          SizedBox(height: 64),
          SizedBox(
            width: 250,
            child: Text(
              'Dramatically unleash cutting-edge vortals before maintainable platforms.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
          CustomButton(
            text: 'Sign Up',
            buttonColor: Colors.transparent,
            textColor: AppColor.kSecondaryColor,
            onPressed: () => Navigator.pushNamed(context, SignUpScreen.id),
          ),
          SizedBox(height: 12),
          CustomButton(
            text: 'Log In',
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
