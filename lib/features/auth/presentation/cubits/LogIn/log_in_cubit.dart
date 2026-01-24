import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInState.initial());
  void setEmail(String email) {
    emit(state.cobyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.cobyWith(password: password));
  }

  void setRememberMe(bool? rememberMe) {
    emit(state.cobyWith(remmberMe: rememberMe ?? false));
  }

  void clearState() {
    emit(state.cobyWith(status: LogInStatus.initial, errorMessage: 'cleared'));
  }

  Future<void> logIn() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(
        state.cobyWith(
          status: LogInStatus.failure,
          errorMessage: 'Email and Password must not be empty',
        ),
      );
      return;
    }
    emit(state.cobyWith(status: LogInStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.cobyWith(status: LogInStatus.success));
    } catch (e) {
      state.cobyWith(status: LogInStatus.failure, errorMessage: e.toString());
    }
  }
}
