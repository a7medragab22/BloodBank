import 'package:blodbank/core/ReusableCompounds/widgets/custom_button.dart';
import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/auth/presentation/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(title: Text('Become Donor')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Label(
                text: 'Name:',
                hintText: 'Enter your Name',
                textAlign: TextAlign.left,
                preffixIcon: Icons.person,
              ),
              SizedBox(height: 16.h),
              Label(
                text: 'Last Donation Date:',
                hintText: 'Enter the date of your last donation',
                textAlign: TextAlign.left,
                preffixIcon: Icons.date_range,
              ),
              SizedBox(height: 16.h),
              ChoseGender(),
              SizedBox(height: 16.h),
              SelectBlodType(),
              SizedBox(height: 16.h),
              WeightSlider(),
              SizedBox(height: 16.h),
              CustomButton(text: 'Done'),
            ],
          ),
        ),
      ),
    );
  }
}

class WeightSlider extends StatefulWidget {
  const WeightSlider({super.key});

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  double weight = 50; // default value

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
                Icon(Icons.person, color: AppColor.kSecondaryColor, size: 28),
                SizedBox(width: 8.w),
                Text(
                  "Weight",
                  style: TextStyle(fontSize: 20.sp, color: Colors.grey[500]),
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

        SizedBox(height: 16.h),

        /// ---------- Slider ----------
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColor.kSecondaryColor,
            inactiveTrackColor: Colors.grey[400],
            thumbColor: AppColor.kPrimaryColor,
            trackHeight: 4.h,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: Slider(
            value: weight,
            min: 30,
            max: 120,
            onChanged: (value) {
              setState(() {
                weight = value;
              });
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
  const SelectBlodType({super.key});

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
  const ChoseGender({super.key});

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
