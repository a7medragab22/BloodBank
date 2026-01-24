import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/NavigationBar/presentation/Views/navigation_bar.dart';
import 'package:blodbank/core/ReusableCompounds/widgets/logo.dart';
import 'package:blodbank/features/auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:blodbank/features/auth/presentation/screens/login_screen.dart';
import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpInfoBody extends StatelessWidget {
  const SignUpInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: BlocListener<SignUpCubit, SignUpState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == SignUpStatus.failure) {
              final controller = ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              controller.closed.then((reason) {
                context.read<SignUpCubit>().clearState();
              });
              context.read<SignUpCubit>().clearState();
            } else if (state.status == SignUpStatus.success) {
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
                preffixIcon: Icons.person_outline,
                text: 'Full Name',
                hintText: 'enter your Name',
                textAlign: TextAlign.start,
                onChanged: (value) =>
                    context.read<SignUpCubit>().setFullName(value),
              ),
              SizedBox(height: 16),
              Label(
                preffixIcon: Icons.badge_outlined,
                text: 'National Id',
                hintText: 'enter National Id',
                textAlign: TextAlign.start,
                onChanged: (value) =>
                    context.read<SignUpCubit>().setNationalId(int.parse(value)),
              ),
              SizedBox(height: 16),
              Label(
                preffixIcon: Icons.phone_outlined,
                text: 'Phone Number',
                hintText: 'enter your phone number',
                textAlign: TextAlign.start,
                onChanged: (value) => context
                    .read<SignUpCubit>()
                    .setPhoneNumber(int.parse(value)),
              ),
              SizedBox(height: 16),
              Label(
                preffixIcon: Icons.lock_outline,
                text: 'Password',
                hintText: 'password',
                textAlign: TextAlign.start,
                onChanged: (value) =>
                    context.read<SignUpCubit>().setPassword(value),
              ),
              SizedBox(height: 16),
              Label(
                preffixIcon: Icons.lock_outline,
                text: 'Confirm Password',
                hintText: 'passsword',
                textAlign: TextAlign.start,
                onChanged: (value) =>
                    context.read<SignUpCubit>().setConfirmPassword(value),
              ),
              SizedBox(height: 32),

              BlocConsumer<SignUpCubit, SignUpState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  if (state.status == SignUpStatus.failure) {
                    final snack = ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                    snack.closed.then(
                      (value) => context.read<SignUpCubit>().clearState(),
                    );
                  } else if (state.status == SignUpStatus.success) {
                    Navigator.pushReplacementNamed(context, NavigationBBar.id);
                  }
                },
                builder: (context, state) {
                  if (state.status == SignUpStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.kPrimaryColor,
                      ),
                    );
                  }
                  return CustomButton(
                    text: 'create an account',
                    onPressed: () => context.read<SignUpCubit>().signUp(),
                  );
                },
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: AppColor.kPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Text(
                    'i dont have an account',
                    style: TextStyle(fontSize: 18),
                  ),
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
