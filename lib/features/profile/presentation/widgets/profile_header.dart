import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:assignment/features/profile/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppRadius.r40,
          backgroundColor: AppColors.textFieldBG,
          backgroundImage: AssetImage(user.avatarAsset),
        ),
        const SizedBox(height: AppSpacing.s12),
        Text(user.name, style: AppTextStyle.title24Bold),
        const SizedBox(height: AppSpacing.s4),
        Text(
          user.email,
          style: AppTextStyle.body14Regular.copyWith(
            color: AppColors.neutralGray600,
          ),
        ),
      ],
    );
  }
}
