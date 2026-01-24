part of 'log_in_cubit.dart';

enum LogInStatus { initial, loading, success, failure }

@immutable
class LogInState {
  final String email;
  final String password;
  final bool remmberMe;
  final String errorMessage;
  final LogInStatus status;

  const LogInState({
    required this.email,
    required this.password,
    required this.remmberMe,
    required this.errorMessage,
    required this.status,
  });
  factory LogInState.initial() {
    return const LogInState(
      email: 'email',
      password: 'password',
      remmberMe: false,
      errorMessage: 'errorMessage',
      status: LogInStatus.initial,
    );
  }
  LogInState cobyWith({
    String? email,
    String? password,
    bool? remmberMe,
    String? errorMessage,
    LogInStatus? status,
  }) {
    return LogInState(
      email: email ?? this.email,
      password: password ?? this.password,
      remmberMe: remmberMe ?? this.remmberMe,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
