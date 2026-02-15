import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/widgets/findLocation/presentation/widgets/hospital_tab.dart';
import 'package:blodbank/features/Home/presentation/Views/Donate/presentation/widgets/findLocation/presentation/widgets/person_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindHospitalView extends StatelessWidget {
  const FindHospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become Donor', style: TextStyle(fontSize: 18)),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Hospital'),
                  Tab(text: 'Person Requests'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [HospitalsTab(), PersonTap()]),
            ),
          ],
        ),
      ),
    );
  }
}
