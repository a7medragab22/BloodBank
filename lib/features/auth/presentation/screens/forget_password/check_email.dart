import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/new_password.dart';
import 'package:flutter/material.dart';

class CheckEmail extends StatelessWidget {
  static String id = "CheckEmail";

  const CheckEmail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "التحقق من البريد",
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
                'Assets/images/check_your_email.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور السابقة المستخدمة.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),
              ),
            ),

            const SizedBox(height: 50),

            CustomButton(
              text: 'تحقق من بريدك الإلكتروني',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPassword()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
