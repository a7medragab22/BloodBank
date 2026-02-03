import 'package:blodbank/features/auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:blodbank/features/auth/presentation/widgets/sign_up_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SignUpInfoBody(),
      ),
    );
  }
}
