import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor = AppColor.kSecondaryColor,
    this.textColor = Colors.white,
  });
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .85,
      height: 55,

      child: ElevatedButton(
        onPressed: onPressed,

        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(buttonColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: AppColor.kSecondaryColor),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
