import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum _AppButtonType { common, gradient }

class AppButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? borderColor;
  final LinearGradient? gradient;
  final _AppButtonType _type;
  final VoidCallback? onTap;
  final String? iconPath;
  const AppButton.gradient({
    super.key,
    required this.text,
    this.textStyle,
    this.gradient,
    this.onTap,
    this.iconPath,
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
    this.iconPath,
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
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child:
                  iconPath != null
                      ? Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                              iconPath!,
                              height: AppIconSize.iconButtonHeight,
                              width: AppIconSize.iconButtonWidth,
                            ),
                          ),
                          Text(
                            text,
                            style: textStyle ?? AppTextStyle.body16Regular,
                          ),
                        ],
                      )
                      : Center(
                        child: Text(
                          text,
                          style: textStyle ?? AppTextStyle.body16Regular,
                        ),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
