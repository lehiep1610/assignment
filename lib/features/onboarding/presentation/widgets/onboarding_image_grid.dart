import 'package:assignment/app/constants/asset_paths.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:flutter/material.dart';

class OnboardingImageGrid extends StatelessWidget {
  const OnboardingImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final firstImageColumn = [
      AssetPaths.onboardingImage1,
      AssetPaths.onboardingImage2,
      AssetPaths.onboardingImage3,
    ];
    final secondImageColumn = [
      AssetPaths.onboardingImage4,
      AssetPaths.onboardingImage5,
      AssetPaths.onboardingImage6,
    ];
    final thirdImageColumn = [
      AssetPaths.onboardingImage7,
      AssetPaths.onboardingImage8,
      AssetPaths.onboardingImage9,
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageColumn(firstImageColumn),
        const SizedBox(width: AppSpacing.s12),
        _buildImageColumn(secondImageColumn),
        const SizedBox(width: AppSpacing.s12),
        _buildImageColumn(thirdImageColumn),
      ],
    );
  }

  Widget _buildImageColumn(List<String> imagePaths) {
    return Expanded(
      child: Column(
        children: [
          for (var imagePath in imagePaths)
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.s12),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
