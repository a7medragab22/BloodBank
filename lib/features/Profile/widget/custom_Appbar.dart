
import 'package:blodbank/core/custom_Buttoms.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text('Profile settings', style: TextStyle(fontSize: 17)),
          Spacer(flex: 1),
          CustomButtons(
            text: 'Etid',
            textColor: Colors.red,
            width: 93,
            height: 33,
            backgroundColor: Color(0xfffff8f8),
            borderColor: Colors.red,

            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
