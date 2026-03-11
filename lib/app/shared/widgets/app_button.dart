import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

enum _AppButtonType { common, gradient }

class AppButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? borderColor;
  final LinearGradient? gradient;
  final _AppButtonType _type;
  final VoidCallback? onTap;
  const AppButton.gradient({
    super.key,
    required this.text,
    this.textStyle,
    this.gradient,
    this.onTap,
  }) : _type = _AppButtonType.gradient,
       bgColor = null,
       borderColor = null;

  const AppButton.common({
    super.key,
    required this.text,
    this.textStyle,
    this.bgColor,
    this.borderColor,
    this.onTap,
  }) : _type = _AppButtonType.common,
       gradient = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSpacing.buttonHeight,
      decoration: BoxDecoration(
        color:
            _type == _AppButtonType.gradient
                ? null
                : (bgColor ?? AppColors.neutralGray0),
        gradient: _type == _AppButtonType.gradient ? gradient : null,
        borderRadius: BorderRadius.circular(AppRadius.r30),
        border: Border.all(color: borderColor ?? AppColors.transparent),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(text, style: textStyle ?? AppTextStyle.body16Regular),
            ),
          ),
        ),
      ),
    );
  }
}
