import 'package:blodbank/core/Servieces/phone_serviece.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/models/donor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'donor_state.dart';

class DonorCubit extends Cubit<DonorState> {
  DonorCubit() : super(DonorInitial());
  final PhoneService phoneService = PhoneService();
  List<DonorModel> allDonors = [
    DonorModel(
      name: 'Sarah Johnson',
      phoneNumber: '01091244780',
      age: '22',
      image: 'image',
      bloodGroup: 'O+',
      distance: 2.3,
      lastDonationMonth: 3,
      available: true,
    ),
    DonorModel(
      name: 'Sarah Johnson',
      phoneNumber: '01091244780',
      age: '22',
      image: 'image',
      bloodGroup: 'O+',
      distance: 2.3,
      lastDonationMonth: 3,
      available: true,
    ),
    DonorModel(
      name: 'Sarah Johnson',
      phoneNumber: '01091244780',
      age: '22',
      image: 'image',
      bloodGroup: 'O+',
      distance: 2.3,
      lastDonationMonth: 3,
      available: true,
    ),
    DonorModel(
      name: 'Sarah Johnson',
      phoneNumber: '01091244780',
      age: '22',
      image: 'image',
      bloodGroup: 'O+',
      distance: 2.3,
      lastDonationMonth: 3,
      available: true,
    ),
  ];
  void loadDonors() {
    emit(DonorLoaded(allDonors));
  }

  Future<void> callDonor(String phoneNumber) async {
    try {
      await phoneService.makePhoneCall(phoneNumber);
    } catch (e) {
      DonorError('failed to call donor');
    }
  }
}
