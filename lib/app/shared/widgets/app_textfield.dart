import 'package:assignment/app/shared/widgets/gradient_icon.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String prefixIcon;
  final Color? prefixIconColor;
  final LinearGradient gradient;
  final TextInputType? textInputType;
  final bool isObscureText;
  const AppTextField({
    super.key,
    this.controller,
    required this.prefixIcon,
    required this.gradient,
    this.textInputType,
    this.prefixIconColor,
    this.isObscureText = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;
  bool _isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode =
        FocusNode()..addListener(() {
          setState(() {
            _isFocus = _focusNode.hasFocus;
          });
        });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      cursorColor: AppColors.foundationBlueDark,
      cursorWidth: 1.0,
      onTapOutside: (event) => _focusNode.unfocus(),
      style: AppTextStyle.body16Regular,
      keyboardType: widget.textInputType,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s18,
            AppSpacing.s13,
            AppSpacing.s8,
            AppSpacing.s13,
          ),
          child:
              _isFocus
                  ? GradientIcon(
                    gradient: widget.gradient,
                    iconPath: widget.prefixIcon,
                    size: AppIconSize.iconHeight,
                  )
                  : SvgPicture.asset(
                    widget.prefixIcon,
                    colorFilter: ColorFilter.mode(
                      widget.prefixIconColor ?? AppColors.navGray,
                      BlendMode.srcIn,
                    ),
                  ),
        ),
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: BoxConstraints(
          minWidth: AppIconSize.iconWidth,
          minHeight: AppIconSize.iconHeight,
        ),
        fillColor:
            _isFocus ? AppColors.textFieldBGFocus : AppColors.textFieldBG,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r81),
          borderSide: BorderSide(color: AppColors.buttonBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r81),
          borderSide: BorderSide(color: AppColors.textFieldFocusBorder),
        ),
      ),
    );
  }
}
