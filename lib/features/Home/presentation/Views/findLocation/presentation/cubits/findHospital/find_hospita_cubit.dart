import 'package:blodbank/features/Home/presentation/Views/findLocation/presentation/model/find_hospital_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'find_hospita_state.dart';

class FindHospitaCubit extends Cubit<FindHospitalState> {
  FindHospitaCubit() : super(FindHospitalInitial());
  void loadHospital() {
    emit(
      FindHospitalLoaded([
        FindHospitalModel(
          name: 'City General Hospital',
          address: '123 Main Street, Downtown',
          distance: 0.8,
          rating: 4.8,
          time: '~15 min',
          phone: '(+20) 1091244780',
          availability: '24/7 ',
        ),
        FindHospitalModel(
          name: 'City General Hospital',
          address: '123 Main Street, Downtown',
          distance: 0.8,
          rating: 4.8,
          time: '~15 min',
          phone: '(+20) 1091244780',
          availability: '24/7 ',
        ),
        FindHospitalModel(
          name: 'City General Hospital',
          address: '123 Main Street, Downtown',
          distance: 0.8,
          rating: 4.8,
          time: '~15 min',
          phone: '(+20) 1091244780',
          availability: '24/7 ',
        ),
        FindHospitalModel(
          name: 'City General Hospital',
          address: '123 Main Street, Downtown',
          distance: 0.8,
          rating: 4.8,
          time: '~15 min',
          phone: '(+20) 1091244780',
          availability: '24/7 ',
        ),
      ]),
    );
  }
}
