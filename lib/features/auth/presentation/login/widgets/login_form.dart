import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/utils/form_validator.dart';
import 'package:assignment/app/shared/widgets/app_button.dart';
import 'package:assignment/app/shared/widgets/app_textfield.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onForgotPasswordPressed;
  final VoidCallback onAppleSignInPressed;
  final VoidCallback onGoogleSignInPressed;
  const LoginForm({
    super.key,
    required this.onLoginPressed,
    required this.onForgotPasswordPressed,
    required this.onAppleSignInPressed,
    required this.onGoogleSignInPressed,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      widget.onLoginPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.loginTitle, style: AppTextStyle.title24Bold),
          const SizedBox(height: AppSpacing.s8),
          Text(
            AppStrings.loginDescription,
            style: AppTextStyle.body14Regular.copyWith(
              color: AppColors.navGray,
            ),
          ),
          const SizedBox(height: AppSpacing.s40),
          Text(AppStrings.userName, style: AppTextStyle.body16Regular),
          const SizedBox(height: AppSpacing.s8),
          AppTextField(
            controller: _usernameController,
            prefixIcon: AssetPaths.userTextField,
            prefixIconColor: AppColors.navGray,
            gradient: AppColors.primaryButtonLinearGradient,
            validator: FormValidators.email,
          ),
          const SizedBox(height: AppSpacing.s18),
          Text(AppStrings.password, style: AppTextStyle.body16Regular),
          const SizedBox(height: AppSpacing.s8),
          AppTextField(
            controller: _passwordController,
            prefixIcon: AssetPaths.passwordTextfield,
            prefixIconColor: AppColors.navGray,
            isObscureText: true,
            gradient: AppColors.primaryButtonLinearGradient,
            validator: FormValidators.password,
          ),
          const SizedBox(height: AppSpacing.s28),
          AppButton.gradient(
            onTap: _onLoginPressed,
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
          const SizedBox(height: AppSpacing.s42),
          _OrDivider(),
          const SizedBox(height: AppSpacing.s42),
          AppButton.common(
            onTap: widget.onAppleSignInPressed,
            bgColor: AppColors.foundationBlueDark,
            textStyle: AppTextStyle.body16Medium.copyWith(
              color: AppColors.neutralGray0,
            ),
            text: AppStrings.signInWithApple,
            iconPath: AssetPaths.appleIcon,
          ),
          const SizedBox(height: AppSpacing.s12),
          AppButton.common(
            onTap: widget.onGoogleSignInPressed,
            borderColor: AppColors.buttonBorder,
            textStyle: AppTextStyle.body16Medium.copyWith(
              color: AppColors.neutralGray600,
            ),
            text: AppStrings.signInWithGoogle,
            iconPath: AssetPaths.googleIcon,
          ),
        ],
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.orDividerColor)),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s14,
            vertical: AppSpacing.s4,
          ),
          decoration: BoxDecoration(
            color: AppColors.orContainerColor,
            borderRadius: BorderRadius.circular(AppRadius.r24),
          ),
          child: Text(
            AppStrings.or,
            style: AppTextStyle.caption12SemiBold.copyWith(
              color: AppColors.captionText9E91DA,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.orDividerColor)),
      ],
    );
  }
}
