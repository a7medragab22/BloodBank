part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, loading, success, failure }

@immutable
class SignUpState {
  final String fullName;
  final int nationalId;
  final int phoneNumber;
  final String password;
  final String confirmPassword;
  final String errorMessage;
  final SignUpStatus status;

  const SignUpState({
    required this.fullName,
    required this.nationalId,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.errorMessage,
    required this.status,
  });
  factory SignUpState.initial() {
    return const SignUpState(
      fullName: '',
      nationalId: 0,
      phoneNumber: 0,
      password: '',
      confirmPassword: '',
      errorMessage: '',
      status: SignUpStatus.initial,
    );
  }
  SignUpState cobyWith({
    String? fullName,
    int? nationalId,
    int? phoneNumber,
    String? password,
    String? confirmPassword,
    String? errorMessage,
    SignUpStatus? status,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      nationalId: nationalId ?? this.nationalId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
