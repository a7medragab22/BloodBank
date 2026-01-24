
import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class DonorInfoCard extends StatelessWidget {
  const DonorInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 215, 214, 214),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * .29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Regenration cycle',
                    style: TextStyle(
                      color: AppColor.kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(
                    'Assets/images/blod_logo.png',
                    width: 120,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    '90 days passed',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * .14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'Assets/images/blod_logo.png',
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        'Blood Type',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * .14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'Assets/images/blod_logo.png',
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        'Number of donations',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
