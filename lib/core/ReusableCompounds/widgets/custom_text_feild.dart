import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final InputBorder? border;
  final Color hintColor;
  final TextAlign textAlign;
  final IconData? preffixIcon;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.border,
    this.hintColor = Colors.black,
    this.textAlign = TextAlign.right,
    this.preffixIcon,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscure,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintColor, fontSize: 14),
        prefixIcon: Icon(widget.preffixIcon, color: AppColor.kSecondaryColor),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : (widget.icon != null
                  ? Icon(widget.icon, color: Colors.grey)
                  : null),

        border:
            widget.border ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
