import 'package:blodbank/features/presentation/widgets/findLocation/presentation/widgets/hospital_info_card.dart';
import 'package:blodbank/features/presentation/widgets/findLocation/presentation/cubits/findHospital/find_hospita_cubit.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalsView extends StatelessWidget {
  const HospitalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text('Hospitals', style: TextStyle(fontSize: 18)),
      ),
      body: BlocBuilder<FindHospitaCubit, FindHospitalState>(
        builder: (context, state) {
          if (state is FindHospitalLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (_, i) => HospitalInfoCard(model: state.hospitals[i]),
              separatorBuilder: (_, __) => const SizedBox(height: 12),
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
