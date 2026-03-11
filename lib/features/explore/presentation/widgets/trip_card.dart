import 'package:assignment/app/constants/app_strings.dart';
import 'package:assignment/app/shared/utils/number_formatter.dart';
import 'package:assignment/app/theme/app_colors.dart';
import 'package:assignment/app/theme/app_demensions.dart';
import 'package:assignment/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int? rentedProps;
  final double? width;

  const TripCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.rentedProps,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.neutralGray0,
        borderRadius: BorderRadius.circular(AppRadius.r10),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadowColor,
            blurRadius: AppRadius.r96,
            offset: const Offset(AppSpacing.s0, AppSpacing.s24),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                color: AppColors.loadingCircleColor,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              );
            },
            errorBuilder:
                (_, __, ___) => Container(
                  color: AppColors.loadingCircleColor,
                  child: const Icon(
                    Icons.broken_image_outlined,
                    color: AppColors.navGray,
                  ),
                ),
          ),

          Positioned(
            bottom: AppSpacing.s0,
            left: AppSpacing.s0,
            right: AppSpacing.s0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s18,
                vertical: AppSpacing.s16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppRadius.r10),
                  bottomRight: Radius.circular(AppRadius.r10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.body16Semibold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (rentedProps != null)
                    Text(
                      '${NumberFormatter.formatNumber(rentedProps ?? 0)} ${AppStrings.rentedProps}',
                      style: AppTextStyle.caption12Medium.copyWith(
                        color: AppColors.navGray,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
