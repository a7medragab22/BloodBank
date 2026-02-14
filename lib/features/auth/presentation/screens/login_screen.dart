import 'package:blodbank/features/auth/presentation/widgets/login_info_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log In', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: LoginInfoBody(),
    );
  }
}
