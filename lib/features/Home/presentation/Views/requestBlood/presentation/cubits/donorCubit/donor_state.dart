part of 'donor_cubit.dart';

abstract class DonorState {}

class DonorInitial extends DonorState {}

class DonorLoaded extends DonorState {
  final List<DonorModel> donors;
  DonorLoaded(this.donors);
}
class DonorError extends DonorState {
  final String message;
  DonorError(this.message);
}
