import 'package:flutter/material.dart';
import 'package:blodbank/features/Profile/widget/custom_Appbar.dart';
import 'package:blodbank/features/Profile/widget/profile_views_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(),
      ),
      body: const ProfileViewsBody(),
    );
  }
}