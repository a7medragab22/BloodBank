import 'package:blodbank/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class RequestBlodView extends StatelessWidget {
  const RequestBlodView({super.key});
  static String id = 'RequestBlood';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(title: Text('Blood Request')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withValues(alpha: .88),
                    ),
                    child: Center(
                      child: Text(
                        '🔍    Find Donors',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.kSecondaryColor,
                    ),
                    child: Center(
                      child: Text(
                        '+    New Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              BloodRequestCard(),
              SizedBox(height: 16),
              BloodRequestCard(),
              SizedBox(height: 16),
              BloodRequestCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  const BloodRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 280,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),

      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Patient: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Ahmed Mohsen bew bew',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Container(
                  height: 28,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.kPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Critical',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: AppColor.kSecondaryColor,
                    size: 20,
                  ),
                ),
                Text('A+  |  ', style: TextStyle(color: Colors.grey)),
                Text('3 Unites', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16),
                Icon(Icons.timer_outlined, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text('14 days ago', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Text(
              'Patient requires urgent blood transfusion due to surgery.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text(
                  'City genral hospital',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.timer_outlined, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text(
                  'Needed by: 20 Aug, 2025',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.people, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text(
                  '8 donors responded',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  height: 35,
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.kPrimaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'I Can Help',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.black, size: 18),
                      SizedBox(width: 4),
                      Text(
                        'Call',
                        style: TextStyle(color: Colors.black, fontSize: 14),
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
