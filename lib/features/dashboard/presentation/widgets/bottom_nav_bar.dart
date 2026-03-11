import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/widgets/gradient_widget.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    (
      icon: AssetPaths.homeIcon,
      activeIcon: AssetPaths.homeActiveIcon,
      label: AppStrings.home,
    ),
    (
      icon: AssetPaths.exploreIcon,
      activeIcon: AssetPaths.exploreActiveIcon,
      label: AppStrings.explore,
    ),
    (
      icon: AssetPaths.chatIcon,
      activeIcon: AssetPaths.chatActiveIcon,
      label: AppStrings.chat,
    ),
    (
      icon: AssetPaths.savedIcon,
      activeIcon: AssetPaths.savedActiveIcon,
      label: AppStrings.saved,
    ),
    (
      icon: AssetPaths.profileIcon,
      activeIcon: AssetPaths.profileActiveIcon,
      label: AppStrings.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: AppSpacing.bottomNavBarHeight,
        decoration: const BoxDecoration(color: AppColors.neutralGray0),
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == currentIndex;
            return _NavItem(
              iconPath: item.icon,
              activeIconPath: item.activeIcon,
              label: item.label,
              isSelected: isSelected,
              onTap: () => onTap(index),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String activeIconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.iconPath,
    required this.activeIconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              SvgPicture.asset(
                activeIconPath,
                width: AppIconSize.iconButtonWidth,
                height: AppIconSize.iconButtonHeight,
              )
            else
              SvgPicture.asset(
                iconPath,
                width: AppIconSize.iconButtonWidth,
                height: AppIconSize.iconButtonHeight,
              ),
            const SizedBox(height: AppSpacing.s4),
            if (isSelected)
              GradientWidget.text(
                text: label,
                textStyle: AppTextStyle.caption12SemiBold.copyWith(
                  color: AppColors.orContainerColor,
                ),
                gradient: AppColors.primaryButtonLinearGradient,
              )
            else
              Text(
                label,
                style: AppTextStyle.caption12Medium.copyWith(
                  color: AppColors.navGray,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
