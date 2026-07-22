import 'package:blodbank/core/ReusableCompounds/widgets/custom_dropdown_feild.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/requestBlood/presentation/cubits/donorCubit/donor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  String _selectedBloodType = 'O+';
  String _selectedCity = 'Cairo (القاهرة)';

  final List<String> _egyptianCities = const [
    'Alexandria (الإسكندرية)',
    'Aswan (أسوان)',
    'Asyut (أسيوط)',
    'Beheira (البحيرة)',
    'Beni Suef (بني سويف)',
    'Cairo (القاهرة)',
    'Dakahlia (الدقهلية)',
    'Damietta (دمياط)',
    'Faiyum (الفيوم)',
    'Gharbia (الغربية)',
    'Giza (الجيزة)',
    'Ismailia (الإسماعيلية)',
    'Kafr El Sheikh (كفر الشيخ)',
    'Luxor (الأقصر)',
    'Matrouh (مرسى مطروح)',
    'Minya (المنيا)',
    'Monufia (المنوفية)',
    'New Valley (الوادي الجديد)',
    'North Sinai (شمال سيناء)',
    'Port Said (بورسعيد)',
    'Qalyubia (القليوبية)',
    'Qena (قنا)',
    'Red Sea (البحر الأحمر)',
    'Sharqia (الشرقية)',
    'Sohag (سوهاج)',
    'South Sinai (جنوب سيناء)',
    'Suez (السويس)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomDropdownField(
                  value: _selectedBloodType,
                  items: const [
                    'A+',
                    'A-',
                    'B-',
                    'B+',
                    'O+',
                    'O-',
                    'AB+',
                    'AB-',
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedBloodType = value ?? 'O+';
                    });
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomDropdownField(
                  value: _selectedCity,
                  items: _egyptianCities,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value ?? 'Cairo (القاهرة)';
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Reset filter to load all donors
                    context.read<DonorCubit>().loadDonors();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF64748B),
                    side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<DonorCubit>().filterDonors(
                          bloodGroup: _selectedBloodType,
                          location: _selectedCity,
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.kPrimaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Apply Filter",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
