import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/requestBlood/presentation/cubits/bloodRequest/blood_request_cubit.dart';
import 'package:blodbank/features/requestBlood/presentation/models/blood_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodRequestView extends StatefulWidget {
  const BloodRequestView({super.key});

  @override
  State<BloodRequestView> createState() => _BloodRequestViewState();
}

class _BloodRequestViewState extends State<BloodRequestView> {
  final _formKey = GlobalKey<FormState>();

  final patientController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  String? bloodType = 'A+';
  String urgencyLevel = "Normal";
  int unitsCount = 1;
  String? _selectedLocation;

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
  void dispose() {
    patientController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: Form(
            key: _formKey,
            child: BlocConsumer<BloodRequestCubit, BloodRequestState>(
              listener: (context, state) {
                if (state is BloodRequestSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Success'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Request Blood",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Fill out the details below",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Card 1: Blood Type Needed
                    _buildSectionCard(
                      title: "Blood Type Needed",
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildBloodTypeChip('O+'),
                              _buildBloodTypeChip('O-'),
                              _buildBloodTypeChip('A+'),
                              _buildBloodTypeChip('A-'),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildBloodTypeChip('B+'),
                              _buildBloodTypeChip('B-'),
                              _buildBloodTypeChip('AB+'),
                              _buildBloodTypeChip('AB-'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Card 2: Urgency Level
                    _buildSectionCard(
                      title: "Urgency Level",
                      child: Column(
                        children: [
                          _buildUrgencyOption(
                            "Normal",
                            "Within 24–48 hours",
                            const Color(0xFF00A86B),
                          ),
                          _buildUrgencyOption(
                            "Urgent",
                            "Within 6–12 hours",
                            const Color(0xFFFF9F0A),
                          ),
                          _buildUrgencyOption(
                            "Critical",
                            "Immediate — within 1–2 hours",
                            const Color(0xFFFF3B30),
                          ),
                        ],
                      ),
                    ),

                    // Card 3: Units Required
                    _buildSectionCard(
                      title: "Units Required",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (unitsCount > 1) {
                                setState(() {
                                  unitsCount--;
                                });
                              }
                            },
                            child: Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBEBF0),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "$unitsCount",
                                style: TextStyle(
                                  color: AppColor.kPrimaryColor,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "unit (≈ 450 ml)",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                unitsCount++;
                              });
                            },
                            child: Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: AppColor.kPrimaryColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Card 4: Patient Details
                    _buildSectionCard(
                      title: "Patient Details",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLocationDropdown(),
                          _buildInputField(
                            "Description",
                            descriptionController,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),

                    // Action Button
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: state is BloodRequestLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColor.kPrimaryColor,
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 52.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final model = BloodRequestModel(
                                      patientName: patientController.text,
                                      bloodType: bloodType!,
                                      unitsNeeded: unitsCount,
                                      urgencyLevel: urgencyLevel,
                                      location: _selectedLocation ?? '',
                                      contactPhone: phoneController.text,
                                      description: descriptionController.text,
                                    );
                                    context
                                        .read<BloodRequestCubit>()
                                        .submitRequest(model);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Confirm Request",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          child,
        ],
      ),
    );
  }

  Widget _buildBloodTypeChip(String type) {
    bool isSelected = bloodType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            bloodType = type;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.kPrimaryColor
                : const Color(0xFFF7F7F9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUrgencyOption(String level, String time, Color color) {
    bool isSelected = urgencyLevel == level;
    return GestureDetector(
      onTap: () {
        setState(() {
          urgencyLevel = level;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.08)
              : const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(16.r),
          border: isSelected ? Border.all(color: color, width: 1.5) : null,
        ),
        child: Row(
          children: [
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? color : Colors.black,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  time,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            if (isSelected) Icon(Icons.check, color: color),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8.h),
          DropdownButtonFormField<String>(
            initialValue: _selectedLocation,
            hint: Text(
              "Choose your city",
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            validator: (v) =>
                (v == null || v.isEmpty) ? "Required field" : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7F7F9),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColor.kPrimaryColor,
                  width: 1.5,
                ),
              ),
            ),
            items: _egyptianCities
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedLocation = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller, {
    bool isNumber = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : null,
            inputFormatters: isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            maxLines: maxLines,
            validator: (v) =>
                (v == null || v.isEmpty) ? "Required field" : null,
            decoration: InputDecoration(
              hintText: "Enter $label",
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
              filled: true,
              fillColor: const Color(0xFFF7F7F9),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: AppColor.kPrimaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
