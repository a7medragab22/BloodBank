import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/findLocation/presentation/cubits/findHospital/find_hospita_cubit.dart';
import 'hospital_info_card.dart';

class HospitalsTab extends StatelessWidget {
  const HospitalsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindHospitaCubit, FindHospitalState>(
      builder: (context, state) {
        if (state is FindHospitalLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, i) => HospitalInfoCard(model: state.hospitals[i]),
            separatorBuilder: (_, __) => const SizedBox(height: 6),
            itemCount: state.hospitals.length,
          );
        }

        return const Center(
          child: CircularProgressIndicator(color: AppColor.kPrimaryColor),
        );
      },
    );
  }
}
