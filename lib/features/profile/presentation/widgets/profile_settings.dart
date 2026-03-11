import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSettingsItem(
          AppStrings.personalDetails,
          AssetPaths.userTextField,
        ),
        SizedBox(height: AppSpacing.s24),
        _buildSettingsItem(AppStrings.settings, AssetPaths.profileSettings),
        SizedBox(height: AppSpacing.s24),
        _buildSettingsItem(
          AppStrings.paymentDetails,
          AssetPaths.profileCardIcon,
        ),
        SizedBox(height: AppSpacing.s24),
        _buildSettingsItem(AppStrings.faq, AssetPaths.profileFAQIcon),
        Divider(
          color: AppColors.foundationWhiteNormalHover,
          height: AppSpacing.s56,
        ),
        _buildSettingsItem(
          AppStrings.switchToHosting,
          AssetPaths.profileSwitchAccountIcon,
        ),
      ],
    );
  }

  Widget _buildSettingsItem(String title, String iconPath) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.s9),
          width: AppIconSize.iconProfileSettingsWidth,
          height: AppIconSize.iconProfileSettingsHeight,
          decoration: BoxDecoration(
            color: AppColors.neutralGray0,
            borderRadius: BorderRadius.circular(AppRadius.r10),
            border: Border.all(
              color: AppColors.buttonBorder,
              width: AppSpacing.borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.profileSettingsShadowColor,
                blurRadius: AppRadius.r16,
                offset: const Offset(AppSpacing.s0, AppSpacing.s4),
              ),
            ],
          ),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              AppColors.foundationBlueDark,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.s12),
        Text(title, style: AppTextStyle.body16Medium),
        Spacer(),
        SvgPicture.asset(AssetPaths.arrowRight),
      ],
    );
  }
}
