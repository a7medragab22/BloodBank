import 'package:blodbank/core/ReusableCompounds/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    required this.hintText,
    this.border,
    this.textFieldBodyColor = Colors.transparent,
    this.hintColor = Colors.black,
    this.textAlign = TextAlign.right,
    this.preffixIcon,
    this.onChanged,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });
  final String text, hintText;
  final InputBorder? border;
  final Color textFieldBodyColor;
  final Color hintColor;
  final TextAlign textAlign;
  final IconData? preffixIcon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: textFieldBodyColor,
          ),
          child: CustomTextField(
            hintText: hintText,
            border: border,
            hintColor: hintColor,
            textAlign: textAlign,
            preffixIcon: preffixIcon,
            onChanged: onChanged,
            keyboardType: keyboardType,
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            validator: validator,
          ),
        ),
      ],
    );
  }
}