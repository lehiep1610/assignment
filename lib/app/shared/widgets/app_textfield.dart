import 'package:assignment/app/shared/widgets/gradient_widget.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String prefixIcon;
  final Color? prefixIconColor;
  final String? suffixIcon;
  final Color? suffixIconColor;
  final LinearGradient gradient;
  final TextInputType? textInputType;
  final bool isObscureText;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  const AppTextField({
    super.key,
    this.controller,
    required this.prefixIcon,
    required this.gradient,
    this.suffixIcon,
    this.suffixIconColor,
    this.validator,
    this.textInputType,
    this.prefixIconColor,
    this.hintText,
    this.hintStyle,
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
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      validator: widget.validator,
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
          child: _buildIconBaseOnFocusState(
            widget.prefixIcon,
            widget.prefixIconColor,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: BoxConstraints(
          minWidth: AppIconSize.iconTextFieldWidth,
          minHeight: AppIconSize.iconTextFieldHeight,
        ),
        hintStyle: widget.hintStyle ?? AppTextStyle.body16Regular,
        hintText: widget.hintText,
        suffixIcon:
            widget.suffixIcon != null
                ? Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.s0,
                    AppSpacing.s13,
                    AppSpacing.s18,
                    AppSpacing.s13,
                  ),
                  child: _buildIconBaseOnFocusState(
                    widget.suffixIcon!,
                    widget.suffixIconColor,
                  ),
                )
                : null,
        suffixIconConstraints: BoxConstraints(
          minWidth: AppIconSize.iconTextFieldWidth,
          minHeight: AppIconSize.iconTextFieldHeight,
        ),
        fillColor:
            _isFocus ? AppColors.textFieldBGFocus : AppColors.textFieldBG,
        enabledBorder: _buildBorder(AppColors.buttonBorder),
        focusedBorder: _buildBorder(AppColors.textFieldFocusBorder),
        errorBorder: _buildBorder(AppColors.errorColor),
        focusedErrorBorder: _buildBorder(AppColors.errorColor),
      ),
    );
  }

  Widget _buildIconBaseOnFocusState(String iconPath, Color? iconColor) {
    if (_isFocus) {
      return GradientWidget.icon(
        gradient: widget.gradient,
        iconPath: iconPath,
        size: AppIconSize.iconTextFieldHeight,
      );
    }
    return SvgPicture.asset(
      iconPath,
      colorFilter: ColorFilter.mode(
        iconColor ?? AppColors.navGray,
        BlendMode.srcIn,
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadius.r81),
    borderSide: BorderSide(color: color),
  );
}
