part of 'find_hospita_cubit.dart';

abstract class FindHospitaState {}

class FindHospitalInitial extends FindHospitaState {}

class FindHospitalLoaded extends FindHospitaState {
  final List<FindHospitalModel> hospitals;
  FindHospitalLoaded(this.hospitals);
}

class FindHospitalFailure extends FindHospitaState {
  final String message;
  FindHospitalFailure(this.message);
}
