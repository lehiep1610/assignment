import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/shared/widgets/app_button.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final VoidCallback onTapLoginButton;
  final VoidCallback onTapSignupButton;
  const OnboardingContent({
    super.key,
    required this.onTapLoginButton,
    required this.onTapSignupButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.overlayOnboardingGradient),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.onboardingTitle, style: AppTextStyle.title24Bold),
          const SizedBox(height: AppSpacing.s8),
          Text(
            AppStrings.onboardingDescription,
            style: AppTextStyle.body16Regular.copyWith(
              letterSpacing: 0.2,
              color: AppColors.navGray,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s32),
          AppButton.gradient(
            onTap: onTapLoginButton,
            text: AppStrings.login,
            gradient: AppColors.primaryButtonLinearGradient,
            textStyle: AppTextStyle.body16Medium.copyWith(
              color: AppColors.neutralGray0,
            ),
          ),
          const SizedBox(height: AppSpacing.s12),
          AppButton.common(
            onTap: onTapSignupButton,
            bgColor: AppColors.neutralGray0,
            borderColor: AppColors.buttonBorder,
            text: AppStrings.signup,
            textStyle: AppTextStyle.body16Medium.copyWith(
              color: AppColors.neutralGray600,
            ),
          ),
        ],
      ),
    );
  }
}
