import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());
  void setFullName(String fullName) {
    emit(state.cobyWith(fullName: fullName));
  }

  void setNationalId(int nationalId) {
    emit(state.cobyWith(nationalId: nationalId));
  }

  void setPhoneNumber(int phoneNumber) {
    emit(state.cobyWith(phoneNumber: phoneNumber));
  }

  void setPassword(String password) {
    emit(state.cobyWith(password: password));
  }

  void setConfirmPassword(String confirmPassword) {
    emit(state.cobyWith(confirmPassword: confirmPassword));
  }

  void clearState() {
    emit(state.cobyWith(status: SignUpStatus.initial));
  }

  Future<void> signUp() async {
    if (state.fullName.isEmpty ||
        state.nationalId == 0 ||
        state.phoneNumber == 0 ||
        state.password.isEmpty ||
        state.confirmPassword.isEmpty) {
      emit(
        state.cobyWith(
          status: SignUpStatus.failure,
          errorMessage: 'All fields are required',
        ),
      );
      return;
    }
    emit(state.cobyWith(status: SignUpStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.cobyWith(status: SignUpStatus.success));
    } catch (e) {
      state.cobyWith(status: SignUpStatus.failure, errorMessage: e.toString());
    }
  }
}
