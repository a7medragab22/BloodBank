import 'package:blodbank/features/presentation/widgets/findLocation/presentation/widgets/person_info_card.dart';
import 'package:blodbank/features/requestBlood/presentation/cubits/bloodRequest/blood_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonRequestsView extends StatelessWidget {
  const PersonRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        title: const Text('Person Requests', style: TextStyle(fontSize: 18)),
      ),
      body: BlocBuilder<BloodRequestCubit, BloodRequestState>(
        builder: (context, state) {
          final cubit = context.read<BloodRequestCubit>();
          final requests = cubit.requests;

          if (requests.isEmpty) {
            return const Center(
              child: Text(
                'No requests yet.\nCreate one from Find Donors!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              itemCount: requests.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return PersonInfoCard(request: requests[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
