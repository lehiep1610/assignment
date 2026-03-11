import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/features/profile/data/datasources/profile_mock_data.dart';
import 'package:assignment/features/profile/presentation/widgets/profile_header.dart';
import 'package:assignment/features/profile/presentation/widgets/profile_settings.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = ProfileMockData.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralGray0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.horizontalPage,
              vertical: AppPaddings.verticalPage,
            ),
            child: Column(
              children: [
                ProfileHeader(user: user),
                const SizedBox(height: AppSpacing.s28),
                const Divider(color: AppColors.foundationWhiteNormalHover),
                const SizedBox(height: AppSpacing.s36),
                ProfileSettings(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
