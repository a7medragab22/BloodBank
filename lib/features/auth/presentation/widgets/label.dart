import 'package:blodbank/core/ReusableCompounds/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.text,
    required this.hintText,
    this.border,
    this.textFieldBodyColor = Colors.transparent,
    this.hintColor = Colors.black,
    this.textAlign = TextAlign.right,
    this.preffixIcon, this.onChanged,
  });
  final String text, hintText;
  final InputBorder? border;
  final Color textFieldBodyColor;
  final Color hintColor;
  final TextAlign textAlign;
  final IconData? preffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 12),
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
          ),
        ),
      ],
    );
  }
}
