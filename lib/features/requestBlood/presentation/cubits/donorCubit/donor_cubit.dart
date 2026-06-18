import 'package:blodbank/core/Servieces/phone_serviece.dart';
import 'package:blodbank/features/requestBlood/presentation/models/donor_model.dart';
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
      location: 'Cairo (القاهرة)',
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
      location: 'Alexandria (الإسكندرية)',
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
      location: 'Giza (الجيزة)',
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
      location: 'Suez (السويس)',
    ),
  ];
  void loadDonors() {
    emit(DonorLoaded(allDonors));
  }

  void filterDonors({required String bloodGroup, required String location}) {
    final filtered = allDonors.where((donor) {
      final matchesBlood = donor.bloodGroup.trim().toLowerCase() == bloodGroup.trim().toLowerCase();
      final matchesLocation = donor.location.trim().toLowerCase() == location.trim().toLowerCase();
      return matchesBlood && matchesLocation;
    }).toList();
    emit(DonorLoaded(filtered));
  }

  void addDonor(DonorModel donor) {
    allDonors.insert(0, donor);
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