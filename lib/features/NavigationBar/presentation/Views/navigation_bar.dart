import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/History/presentation/Views/history_view.dart';
import 'package:blodbank/features/Home/presentation/Views/home_view.dart';
import 'package:blodbank/features/Maps/presentation/Views/map_view.dart';
import 'package:blodbank/features/NavigationBar/presentation/Cubits/navigation/navigation_cubit.dart';

import 'package:blodbank/features/Profile/presentation/Views/progile_view.dart';
import 'package:blodbank/features/Rewards/presentation/views/reward_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBBar extends StatelessWidget {
  const NavigationBBar({super.key});
  static String id = 'NavigationBBar';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final cubit = context.read<NavigationCubit>();
        final pages = [
          const HistoryView(),
          const MapView(),
          const HomeView(),
          const RewardView(),
          const ProgileView(),
        ];
        return Scaffold(
          backgroundColor: Color(0xfffafafa),
          appBar: AppBar(
            title: Text(
              'LifeFlow',
              style: TextStyle(
                color: AppColor.kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
            ],
          ),
          body: pages[cubit.statusToIndex(state.status)],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.statusToIndex(state.status),
            onTap: (value) => cubit.selectByIndex(value),
            selectedItemColor: AppColor.kSecondaryColor,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.gift, size: 20),
                label: 'Rewords',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
