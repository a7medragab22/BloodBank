import 'package:blodbank/core/custom_Buttoms.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(33),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xffdddddd),
              child: Text(
                'Aj',
                style: TextStyle(
                  fontSize: 50,
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 0),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '  Ajit',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            Row(
              children: const [
                Text('🩸', style: TextStyle(fontSize: 20)),
                SizedBox(width: 6),
                Text(
                  'o+ve',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.call, color: Colors.red, size: 27),
                const SizedBox(width: 6),
                const Text('8455457', style: TextStyle(fontSize: 18)),
                SizedBox(width: 30),
                CustomButtons(
                  text: 'call',
                  textColor: Colors.black87,
                  onPressed: () {},
                  width: 85,
                  height: 33,
                  backgroundColor: Color(0xffffffff),
                  borderColor: Colors.red,
                ),
              ],
            ),
          ],
          
        ),
        
      ],
    );
  }
}
