import 'package:blodbank/core/themes/app_color.dart';
import 'package:blodbank/features/History/presentation/Views/history_view.dart';
import 'package:blodbank/features/Home/presentation/Views/home_view.dart';
import 'package:blodbank/features/Maps/presentation/Views/map_view.dart';
import 'package:blodbank/features/NavigationBar/presentation/Cubits/navigation/navigation_cubit.dart';
import 'package:blodbank/features/Profile/presentation/Views/profile_view.dart';
import 'package:blodbank/features/Rewards/presentation/views/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBBar extends StatelessWidget {
  const NavigationBBar({super.key});

  int _statusToUiIndex(NavigationStatus status) {
    switch (status) {
      case NavigationStatus.home:
        return 0;
      case NavigationStatus.maps:
        return 1;
      case NavigationStatus.history:
        return 2;
      case NavigationStatus.rewards:
        return 3;
      case NavigationStatus.profile:
        return 4;
    }
  }

  NavigationStatus _uiIndexToStatus(int uiIndex) {
    switch (uiIndex) {
      case 0:
        return NavigationStatus.home;
      case 1:
        return NavigationStatus.maps;
      case 2:
        return NavigationStatus.history;
      case 3:
        return NavigationStatus.rewards;
      case 4:
        return NavigationStatus.profile;
      default:
        return NavigationStatus.home;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final cubit = context.read<NavigationCubit>();
        final pages = [
          const HistoryView(), // index 0
          const MapView(), // index 1
          const HomeView(), // index 2
          const RewardView(), // index 3
          const ProfileView(), // index 4
        ];

        return Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),

          body: pages[cubit.statusToIndex(state.status)],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    indicatorColor: Colors.transparent,
                    labelTextStyle: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return TextStyle(
                          color: AppColor.kSecondaryColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        );
                      }
                      return TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                      );
                    }),
                    iconTheme: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return IconThemeData(
                          color: AppColor.kSecondaryColor,
                          size: 22.sp,
                        );
                      }
                      return IconThemeData(
                        color: Colors.grey[500],
                        size: 22.sp,
                      );
                    }),
                  ),
                  child: NavigationBar(
                    height: 64.h,
                    selectedIndex: _statusToUiIndex(state.status),
                    onDestinationSelected: (value) {
                      final targetStatus = _uiIndexToStatus(value);
                      cubit.selectedTap(targetStatus);
                    },
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.science_outlined),
                        selectedIcon: Icon(Icons.science),
                        label: 'My Tests',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.receipt_long_outlined),
                        selectedIcon: Icon(Icons.receipt_long_rounded),
                        label: 'Activity',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.card_giftcard_outlined),
                        selectedIcon: Icon(Icons.card_giftcard),
                        label: 'Rewards',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person_outline),
                        selectedIcon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
