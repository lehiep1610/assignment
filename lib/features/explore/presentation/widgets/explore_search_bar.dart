import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/shared/widgets/app_textfield.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ExploreSearchBar extends StatefulWidget {
  const ExploreSearchBar({super.key});

  @override
  State<ExploreSearchBar> createState() => _ExploreSearchBarState();
}

class _ExploreSearchBarState extends State<ExploreSearchBar> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      gradient: AppColors.primaryButtonLinearGradient,
      controller: searchController,
      prefixIcon: AssetPaths.searchTextFieldIcon,
      prefixIconColor: AppColors.foundationBlueDark,
      suffixIcon: AssetPaths.settingsTextFieldIcon,
      suffixIconColor: AppColors.foundationBlueDark,
      hintText: AppStrings.searchAddressHint,
      hintStyle: AppTextStyle.body16Regular.copyWith(color: AppColors.navGray),
    );
  }
}
