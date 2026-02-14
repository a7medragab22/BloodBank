part of 'find_hospita_cubit.dart';

abstract class FindHospitalState {}

class FindHospitalInitial extends FindHospitalState {}

class FindHospitalLoading {}
class FindHospitalLoaded extends FindHospitalState {
  final List<FindHospitalModel> hospitals;
  FindHospitalLoaded(this.hospitals);
}

class FindHospitalFailure extends FindHospitalState {
  final String message;
  FindHospitalFailure(this.message);
}
