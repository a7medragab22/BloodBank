part of 'blood_request_cubit.dart';

abstract class BloodRequestState {}

class BloodRequestInitial extends BloodRequestState {}

class BloodRequestLoading extends BloodRequestState {}

class BloodRequestSuccess extends BloodRequestState {
  final List<BloodRequestModel> requests;
  BloodRequestSuccess(this.requests);
}

class BloodRequestFailure extends BloodRequestState {
  final String message;
  BloodRequestFailure(this.message);
}
