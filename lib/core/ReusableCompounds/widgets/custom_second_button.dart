import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomSecondButton extends StatelessWidget {
  const CustomSecondButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = AppColor.kPrimaryColor,
    this.height = 40,
    this.width = 80,
    required this.onPressed,
  });
  final String text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
