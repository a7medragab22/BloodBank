import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:flutter/material.dart';

import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'check_code.dart';

class ForgetPassword extends StatelessWidget {
  static String id = "ForgetPassword";

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "نسيت كلمة المرور",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'Assets/images/forget_passsword.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Label(
              preffixIcon: Icons.email_outlined,
              text: 'Email',
              hintText: 'example@gmail.com',
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 50),
            CustomButton(
              text: 'Send Code',
              onPressed: () {
                Navigator.pushNamed(context, CheckCode.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
