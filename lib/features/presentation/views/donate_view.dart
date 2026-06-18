import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/Routes/app_routes_name.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:blodbank/features/requestBlood/presentation/models/donor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String bloodType = 'A+';
  double weight = 50;
  String gender = 'male';
  String? _selectedCity;

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
    _ageController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(title: const Text('Become Donor')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Label(
                  text: 'Age:',
                  hintText: 'Enter your age',
                  textAlign: TextAlign.left,
                  preffixIcon: Icons.calendar_today,
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    int? ageInt = int.tryParse(value);
                    if (ageInt == null || ageInt < 18) {
                      return 'السن المطلوب بحد ادني 18 سنه';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                Label(
                  text: 'Last Donation Date:',
                  hintText: 'Select the date',
                  textAlign: TextAlign.left,
                  preffixIcon: Icons.date_range,
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                LabelDropdown(
                  text: 'your location',
                  hintText: 'chose your city',
                  value: _selectedCity,
                  items: _egyptianCities,
                  prefixIcon: Icons.map_outlined,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                ChoseGender(onChanged: (val) => setState(() => gender = val)),
                SizedBox(height: 16.h),
                SelectBlodType(
                  onChanged: (val) => setState(() => bloodType = val),
                ),
                SizedBox(height: 16.h),
                WeightSlider(
                  initialValue: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Done',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (weight < 50) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('الحد الادني للوزن 50 كجم'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Success - Navigate to Upload Report View to verify donor
                      final newDonor = DonorModel(
                        name: 'New Donor (You)',
                        phoneNumber: '0123456789',
                        age: _ageController.text,
                        image: gender == 'male'
                            ? 'Assets/images/male(1)(1).png'
                            : 'Assets/images/female.png',
                        bloodGroup: bloodType,
                        distance: 0.1,
                        lastDonationMonth: 0,
                        available: true,
                        location: _selectedCity ?? 'Cairo (القاهرة)',
                      );

                      Navigator.pushNamed(
                        context,
                        AppRoutesName.uploadReportView,
                        arguments: {
                          'fromDonate': true,
                          'donor': newDonor,
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeightSlider extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double> onChanged;
  const WeightSlider({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  late double weight;

  @override
  void initState() {
    super.initState();
    weight = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.monitor_weight_outlined,
                  color: AppColor.kSecondaryColor,
                  size: 28,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Weight",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "${weight.toInt()} KGS",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.kSecondaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColor.kSecondaryColor,
            inactiveTrackColor: Colors.grey[300],
            thumbColor: AppColor.kPrimaryColor,
            trackHeight: 4.h,
          ),
          child: Slider(
            value: weight,
            min: 30,
            max: 150,
            onChanged: (value) {
              setState(() => weight = value);
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.backRadius = 28,
    this.frontRadius = 26,
    this.onTap,
    required this.blodType,
    this.backColor = Colors.grey,
    this.frontColor = Colors.white,
    this.textColor = Colors.grey,
  });
  final String blodType;
  final double backRadius;
  final double frontRadius;
  final VoidCallback? onTap;
  final Color backColor;
  final Color frontColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: backRadius,
        backgroundColor: backColor,
        child: CircleAvatar(
          radius: frontRadius,
          backgroundColor: frontColor,
          child: Text(
            blodType,
            style: TextStyle(
              color: textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectBlodType extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SelectBlodType({super.key, required this.onChanged});

  @override
  State<SelectBlodType> createState() => _SelectBlodTypeState();
}

class _SelectBlodTypeState extends State<SelectBlodType> {
  String selectBlodType = 'A+';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '  Blood Type:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleAvatar(
                  blodType: 'A+',
                  onTap: () => setState(() {
                    selectBlodType = 'A+';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'A+'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'A+'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'A+'
                      ? Colors.white
                      : Colors.grey,
                ),
                CustomCircleAvatar(
                  blodType: 'A-',
                  onTap: () => setState(() {
                    selectBlodType = 'A-';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'A-'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'A-'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'A-'
                      ? Colors.white
                      : Colors.grey,
                ),
                CustomCircleAvatar(
                  blodType: 'B+',
                  onTap: () => setState(() {
                    selectBlodType = 'B+';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'B+'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'B+'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'B+'
                      ? Colors.white
                      : Colors.grey,
                ),
                CustomCircleAvatar(
                  blodType: 'B-',
                  onTap: () => setState(() {
                    selectBlodType = 'B-';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'B-'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'B-'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'B-'
                      ? Colors.white
                      : Colors.grey,
                ),
                CustomCircleAvatar(
                  blodType: 'O+',
                  onTap: () => setState(() {
                    selectBlodType = 'O+';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'O+'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'O+'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'O+'
                      ? Colors.white
                      : Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCircleAvatar(
                  blodType: 'O-',
                  onTap: () => setState(() {
                    selectBlodType = 'O-';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'O-'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'O-'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'O-'
                      ? Colors.white
                      : Colors.grey,
                ),
                SizedBox(width: 14.w),
                CustomCircleAvatar(
                  blodType: 'AB+',
                  onTap: () => setState(() {
                    selectBlodType = 'AB+';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'AB+'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'AB+'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'AB+'
                      ? Colors.white
                      : Colors.grey,
                ),
                SizedBox(width: 14.w),
                CustomCircleAvatar(
                  blodType: 'AB-',
                  onTap: () => setState(() {
                    selectBlodType = 'AB-';
                    widget.onChanged(selectBlodType);
                  }),
                  backColor: selectBlodType == 'AB-'
                      ? Colors.brown
                      : Colors.grey,
                  frontColor: selectBlodType == 'AB-'
                      ? AppColor.kSecondaryColor
                      : Colors.white,
                  textColor: selectBlodType == 'AB-'
                      ? Colors.white
                      : Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ChoseGender extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const ChoseGender({super.key, required this.onChanged});

  @override
  State<ChoseGender> createState() => _ChoseGenderState();
}

class _ChoseGenderState extends State<ChoseGender> {
  String selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '  Gender:',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedGender = 'male';
                    widget.onChanged(selectedGender);
                  }),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: selectedGender == 'male'
                        ? AppColor.kSecondaryColor
                        : Colors.grey,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.white,
                      child: Image.asset('Assets/images/male(1)(1).png'),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Male',
                  style: TextStyle(
                    color: selectedGender == 'male'
                        ? AppColor.kSecondaryColor
                        : Colors.grey,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(width: 32.w),
            Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedGender = 'female';
                    widget.onChanged(selectedGender);
                  }),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: selectedGender == 'female'
                        ? AppColor.kSecondaryColor
                        : Colors.grey,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.white,
                      child: Image.asset('Assets/images/female.png'),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Female',
                  style: TextStyle(
                    color: selectedGender == 'female'
                        ? AppColor.kSecondaryColor
                        : Colors.grey,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LabelDropdown extends StatelessWidget {
  final String text;
  final String hintText;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const LabelDropdown({
    super.key,
    required this.text,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        DropdownButtonFormField<String>(
          initialValue: value,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: AppColor.kSecondaryColor)
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.kSecondaryColor, width: 2),
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
