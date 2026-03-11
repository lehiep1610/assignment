import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/widgets/app_button.dart';
import 'package:assignment/app/shared/widgets/app_textfield.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.loginTitle, style: AppTextStyle.title24Bold),
        const SizedBox(height: AppSpacing.s8),
        Text(
          AppStrings.loginDescription,
          style: AppTextStyle.body14Regular.copyWith(color: AppColors.navGray),
        ),
        const SizedBox(height: AppSpacing.s40),
        Text(AppStrings.userName, style: AppTextStyle.body16Regular),
        const SizedBox(height: AppSpacing.s8),
        AppTextField(
          controller: _userNameController,
          prefixIcon: AssetPaths.userTextField,
          prefixIconColor: AppColors.navGray,
          gradient: AppColors.primaryButtonLinearGradient,
        ),
        const SizedBox(height: AppSpacing.s18),
        Text(AppStrings.password, style: AppTextStyle.body16Regular),
        const SizedBox(height: AppSpacing.s8),
        AppTextField(
          controller: _userNameController,
          prefixIcon: AssetPaths.passwordTextfield,
          prefixIconColor: AppColors.navGray,
          isObscureText: true,
          gradient: AppColors.primaryButtonLinearGradient,
        ),
        const SizedBox(height: AppSpacing.s28),
        AppButton.gradient(
          onTap: () {},
          text: AppStrings.login,
          gradient: AppColors.primaryButtonLinearGradient,
          textStyle: AppTextStyle.body16Medium.copyWith(
            color: AppColors.neutralGray0,
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.forgotPassword,
              style: AppTextStyle.body14Regular.copyWith(
                color: AppColors.navGray,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
