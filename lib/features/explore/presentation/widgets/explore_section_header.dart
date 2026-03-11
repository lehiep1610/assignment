import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/shared/widgets/gradient_widget.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ExploreSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const ExploreSectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.body18SemiBold),
        if (onSeeAll != null)
          GestureDetector(
            onTap: onSeeAll,
            child: GradientWidget.text(
              text: AppStrings.seeAll,
              textStyle: AppTextStyle.body14Medium.copyWith(
                color: AppColors.orContainerColor,
              ),
              gradient: AppColors.primaryButtonLinearGradient,
            ),
          ),
      ],
    );
  }
}
