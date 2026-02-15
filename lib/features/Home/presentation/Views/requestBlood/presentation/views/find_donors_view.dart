import 'package:blodbank/core/ReusableCompounds/widgets/custom_second_button.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/cubits/bloodRequest/blood_request_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/cubits/donorCubit/donor_cubit.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/widgets/blood_request_sheet.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/widgets/donor_card.dart';
import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/widgets/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDonorsView extends StatelessWidget {
  const FindDonorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarFindDonors(context),

      body: Column(
        children: [
          const FilterSection(),

          Expanded(
            child: BlocBuilder<DonorCubit, DonorState>(
              builder: (context, state) {
                int count = 0;
                if (state is DonorLoaded) {
                  count = state.donors.length;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Text(
                          '$count Donors found',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.donors.length,
                          itemBuilder: (_, index) {
                            return DonorCard(donor: state.donors[index]);
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.kPrimaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarFindDonors(BuildContext context) {
    return AppBar(
      title: const Text("Find Donors", style: TextStyle(fontSize: 18)),
      actions: [
        CustomSecondButton(
          text: '+ New Request',
          height: 40.h,
          width: .4.sw,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocProvider(
                create: (_) => BloodRequestCubit(),
                child: const BloodRequestSheet(),
              ),
            );
          },
        ),
        SizedBox(width: 16.w),
      ],
    );
  }
}
