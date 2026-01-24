import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/ReusableCompounds/widgets/logo.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/NavigationBar/presentation/Views/navigation_bar.dart';
import 'package:blodbank/features/auth/presentation/cubits/LogIn/log_in_cubit.dart';
import 'package:blodbank/features/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:blodbank/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginInfoBody extends StatelessWidget {
  const LoginInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: BlocListener<LogInCubit, LogInState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == LogInStatus.failure) {
              final controller = ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              controller.closed.then((reason) {
                context.read<LogInCubit>().clearState();
              });
              context.read<LogInCubit>().clearState();
            } else if (state.status == LogInStatus.success) {
              Navigator.pushReplacementNamed(context, NavigationBBar.id);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Logo(),
              SizedBox(height: 32),
              Label(
                preffixIcon: Icons.email_outlined,
                text: 'Email',
                hintText: 'example@gmail.com',
                textAlign: TextAlign.start,
                onChanged: (value) {
                  context.read<LogInCubit>().setEmail(value);
                },
              ),
              SizedBox(height: 16),
              Label(
                preffixIcon: Icons.lock_open_outlined,
                text: 'Passsword',
                hintText: 'password',
                textAlign: TextAlign.start,
                onChanged: (value) =>
                    context.read<LogInCubit>().setPassword(value),
              ),
              SizedBox(height: 16),
              BlocBuilder<LogInCubit, LogInState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPassword.id);
                        },
                        child: Text(
                          'Forget Passsword ?',
                          style: TextStyle(color: AppColor.kPrimaryColor),
                        ),
                      ),
                      Row(
                        children: [
                          Text('remember me'),
                          Checkbox(
                            value: state.remmberMe,
                            onChanged: (value) =>
                                context.read<LogInCubit>().setRememberMe(value),
                            checkColor: AppColor.kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 48),
              BlocConsumer<LogInCubit, LogInState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  if (state.status == LogInStatus.failure) {
                    final snack = ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                    snack.closed.then(
                      (_) => context.read<LogInCubit>().clearState(),
                    );
                  } else if (state.status == LogInStatus.success) {
                    Navigator.pushReplacementNamed(context, NavigationBBar.id);
                  }
                },
                builder: (context, state) {
                  if (state.status == LogInStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      context.read<LogInCubit>().logIn();
                    },
                  );
                },
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColor.kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text('dont have an account?', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
