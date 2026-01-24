import 'package:blodbank/core/ReusableCompounds/widgets/icon_favourite_with_back_arrow.dart';
import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  final IconData icon;
  final bool showIcon;
  final String? text;
  final bool showText;
  final Color arrowColor;
  final EdgeInsetsGeometry padding;
  const CustomBackArrow({
    super.key,
    this.icon = Icons.favorite_border,
    this.showIcon = false,
    this.text,
    this.showText = false,
    this.arrowColor = Colors.white,
    this.padding = EdgeInsetsGeometry.zero,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: padding,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // أيقونة داخل دائرة
              showIcon == true
                  ? IconFAvouriteWithBackArrow(icon: icon)
                  : SizedBox(),
              showText == true
                  ? Text(
                      text!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : SizedBox(),
              // السهم
              Icon(Icons.arrow_forward_ios, color: arrowColor, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
