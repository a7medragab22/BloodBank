import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/findHospital/presentation/cubits/findHospital/find_hospita_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/findHospital/presentation/widgets/hospital_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindHospitalView extends StatelessWidget {
  const FindHospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Locations')),
      body: BlocBuilder<FindHospitaCubit, FindHospitaState>(
        builder: (context, state) {
          if (state is FindHospitalLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (_, i) =>
                  HospitalInfoCard(model: state.hospitals[i]),
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemCount: state.hospitals.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kPrimaryColor),
          );
        },
      ),
    );
  }
}
